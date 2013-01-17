class ProductsController < ApplicationController
  def index
    respond_to do |t|
      t.json { render :json => Product.all }
    end
  end
  def discounts
    respond_to do |t|
      t.json {render :json => Discount.where("active = true")}
    end
  end
end
