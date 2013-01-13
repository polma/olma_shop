class ShippingAddress < ActiveRecord::Base
  attr_accessible :country, :house_nr, :name, :order_id, :postal_code, :street, :surname
end
