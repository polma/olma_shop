class AddCityColumnToShippingAddresses < ActiveRecord::Migration
  def change
    add_column :shipping_addresses, :city, :string
  end
end
