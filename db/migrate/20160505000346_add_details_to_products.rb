class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :url, :string, limit: 256
    add_column :products, :image_url, :string, limit: 256
    add_column :products, :description, :string, limit: 256
    add_column :products, :availability, :integer
  end
end
