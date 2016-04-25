class AddPrimaryKeyToAlerts < ActiveRecord::Migration
  def change
    add_index :alerts, ["product_id", "user_id"], :unique => true
  end
end
