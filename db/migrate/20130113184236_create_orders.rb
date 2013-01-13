class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.boolean :confirmed
      t.boolean :sent
      t.boolean :custom_shipping_address

      t.timestamps
    end
  end
end
