class ProductsController < ApplicationController
  def index
    respond_to do |t|
      t.json { render :json => Product.all }
    end
  end
end
