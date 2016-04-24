class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :staples_pid, limit: 6, null: false
      t.string :name, limit: 256
      t.decimal :msrp, precision: 10, scale: 2
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_index :products, :staples_pid
  end
end
