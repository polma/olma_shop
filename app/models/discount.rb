class Discount < ActiveRecord::Base
  attr_accessible :active, :percentage, :product_id
end
