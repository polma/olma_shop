class Size < ActiveRecord::Base
  attr_accessible :name, :product_id, :quantity

  belongs_to :product
end
