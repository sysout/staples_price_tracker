class RemoveMsrpFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :msrp, :decimal, precision: 10, scale: 2
  end
end
