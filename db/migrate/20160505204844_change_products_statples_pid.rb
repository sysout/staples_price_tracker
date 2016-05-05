class ChangeProductsStatplesPid < ActiveRecord::Migration
  def change
    change_column :products, :staples_pid, :string, limit: 8, null: false
  end
end
