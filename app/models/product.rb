class Product < ActiveRecord::Base
  validates :staples_pid, presence: true, length: {maximum: 7, minimum: 6},
            format: {with: /\A[0-9]{6,7}\z/}, uniqueness: true
  before_validation :load_product
  validate :product_exists
  enum availability: [:instock, :oos]

  def get_page(p_id)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    agent.history_added = Proc.new { sleep 0.5 }
    agent.get("http://www.staples.com/product_#{p_id}")
  end

  def load_product
    if self.id!=nil
      # product exist
      return
    end
    page=get_page(self.staples_pid)
    self.name=page.title
    if self.name==nil or self.name.match("Unavailable")
      return
    end
    self.name=page.search('[itemprop="name"]').text
    self.price=page.search('span[itemprop="price"]').text.sub("$", "").to_f
    self.description=page.search('div[itemprop="description"]').text
    self.image_url=page.search('img[itemprop="image"]').attr('src').text
    self.url=page.search('a[itemprop="url"]').attr('href').text
    # ignore item condition, user should know more
    # itemCondition=page.search('link[itemprop="itemCondition"]').attr('href').text
    if "http://schema.org/InStock"==page.search('link[itemprop="availability"]').attr('href').text
      self.availability="instock"
    else
      self.availability="oos"
    end
  end

  def product_exists
    # p_id=1684954  # kindle paperwhite
    if self.name==nil
      return errors.add(:base, 'product not found, please double check!')
    end
    if self.name.match("Unavailable")
      return errors.add(:base, 'site unavailable, try later')
    end
  end

end
