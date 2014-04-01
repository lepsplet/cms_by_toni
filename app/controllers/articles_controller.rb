class ArticlesController < ApplicationController
  def index
	  @subcategory = Subcategory.find(params[:id])
  end

  def show
  end

  def new
  end

  def edit
  end
end
