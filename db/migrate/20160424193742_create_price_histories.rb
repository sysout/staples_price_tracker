class CreatePriceHistories < ActiveRecord::Migration
  def change
    create_table :price_histories do |t|
      t.references :product, index: true, foreign_key: true, null: false
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps null: false, index: true
    end
  end
end
