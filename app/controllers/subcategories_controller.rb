class SubcategoriesController < ApplicationController
  def index
	  @category = Category.find(params[:id])
  end

  def new
	  @category = Category.find(params[:id])
	  @subcategory = @category.subcategories.build
  end

  def edit
  end
end
