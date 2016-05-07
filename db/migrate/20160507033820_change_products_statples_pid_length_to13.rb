class ChangeProductsStatplesPidLengthTo13 < ActiveRecord::Migration
  def change
    change_column :products, :staples_pid, :string, limit: 13, null: false
  end
end
