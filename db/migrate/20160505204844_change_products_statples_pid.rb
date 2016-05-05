class ChangeProductsStatplesPid < ActiveRecord::Migration
  def change
    change_column :products, :staples_pid, :string, limit: 6, null: false
  end
end
