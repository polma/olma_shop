class Customer < ActiveRecord::Base
  attr_accessible :city, :country, :email, :house_nr, :name, :postal_code, :street, :surname, :telephone, :newsletter
  has_many :orders
end
