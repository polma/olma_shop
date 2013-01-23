class ProductsController < ApplicationController
  def index
    p = Product.all
    p.each do |t|
      t['sizes'] = t.sizes
    end
    respond_to do |t|
      t.json { render :json => p }
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
