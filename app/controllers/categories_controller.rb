class CategoriesController < ApplicationController
  def index
    respond_to do |t|
      t.json { render :json => Category.all }
    end
  end
end
