class TextsController < ApplicationController
	layout 'news'
  def show
	  @categories = Category.all
	  @article = Article.find(params[:id])
  end
end
