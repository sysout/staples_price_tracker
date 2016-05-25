class AddPriceHistoriesCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price_histories_count, :integer
  end
end
