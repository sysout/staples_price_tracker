class Product < ActiveRecord::Base
  validates :staples_pid,  presence: true, length: { maximum: 6, minimum: 6 },
            format: { with: /\A[0-9]{6}\z/ }, uniqueness: true
  attr_accessor :staples_pid, :name, :msrp, :price
end
