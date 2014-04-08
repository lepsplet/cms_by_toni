class NewsController < ApplicationController

	layout 'news'
	
  def index
	  @categories = Category.all
  end

  def show
	  @categories = Category.all

	  @subcategories = Subcategory.find(params[:id])
	  @articles = @subcategories.articles

  end
end
