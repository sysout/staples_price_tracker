class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  accepts_nested_attributes_for :product
  validate :product_id_exists

  def product_id_exists
    return false if Product.find_by_id(self.product_id).nil?
  end

end
