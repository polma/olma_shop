class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :order_id
      t.string :name
      t.string :surname
      t.string :street
      t.string :house_nr
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end
