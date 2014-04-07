class NewsController < ApplicationController

	layout 'news'
	
  def index
	  @categories = Category.all
  end

  def show
	  @categories = Category.all
  end
end
