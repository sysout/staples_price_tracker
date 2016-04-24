class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :product, index: true, foreign_key: true, null: false
      t.decimal :desired, precision: 10, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
