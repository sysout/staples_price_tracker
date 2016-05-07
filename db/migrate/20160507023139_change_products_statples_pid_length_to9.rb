class ChangeProductsStatplesPidLengthTo9 < ActiveRecord::Migration
  def change
    change_column :products, :staples_pid, :string, limit: 9, null: false
  end
end
