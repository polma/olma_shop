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
  def recently_added
    recent = Product.select(:id).order("created_at desc").limit(5)
    respond_to do |t|
      t.json {render :json => recent }
    end
  end
end
