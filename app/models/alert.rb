class Alert < ActiveRecord::Base
  before_validation :save_product

  belongs_to :user
  belongs_to :product
  accepts_nested_attributes_for :product
  validate :product_id_exists
  validates :desired, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
            :numericality => {:greater_than => 0, :less_than => 100000}

  def product_id_exists
    return false if Product.find_by_id(self.product_id).nil?
  end


  def save_product
    # Need to manually save since the autosave callbacks have already been called.
    if Product.find_by_staples_pid(self.product.staples_pid)
      self.product = Product.find_by_staples_pid(self.product.staples_pid)
    end
  end

end
