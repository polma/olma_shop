class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :size
  belongs_to :order
  belongs_to :product
end
