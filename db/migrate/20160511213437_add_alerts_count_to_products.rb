class AddAlertsCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :alerts_count, :integer, :default=> 0
  end
end
