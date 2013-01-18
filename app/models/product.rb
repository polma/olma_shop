class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price
  
  belongs_to :category
  has_many :sizes

  validates :price, :numericality => { :only_integer => true }
end
