class SubcategoriesController < ApplicationController
	def index
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.find(params[:id])
		@subcategory = @category.subcategories.build
	end

	def create
		@category = Category.find(params[:id])
		@subcategory = @category.subcategories.build(subcategory_params)

		if @subcategory.save
			redirect_to subcategories_path(id: @subcategory.id)
		else
			render 'new'
		end
	end

	def edit
	end

	private
	def subcategory_params
		params.require(:subcategory).permit(:name) 

	end
end
