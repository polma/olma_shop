class Order < ActiveRecord::Base
  attr_accessible :confirmed, :custom_shipping_address, :customer_id, :sent

  has_many :order_items
  belongs_to :customer
end
