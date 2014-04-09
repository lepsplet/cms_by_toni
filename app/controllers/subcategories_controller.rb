class SubcategoriesController < ApplicationController
	before_action :authenticate_user!

	def index
		@category = Category.find(params[:id])
		@subcategories = @category.subcategories.all
	end

	def new
		@category = Category.find(params[:id])
		@subcategory = @category.subcategories.build
	end

	def create
		@category = Category.find(params[:id])
		@subcategory = @category.subcategories.build(subcategory_params)

		if @subcategory.save
			redirect_to subcategories_path(id: @category.id)
		else
			render 'new'
		end
	end

	def edit
		@subcategory = Subcategory.find(params[:id])
	end
def update
		@subcategory = Subcategory.find(params[:id])

		if @subcategory.update(subcategory_params)
			redirect_to action: :index, id: @subcategory.category_id
			else
				render 'edit'
			end

	end

	def destroy
		@subcategory = Subcategory.find(params[:id])
		@subcategory.destroy
			redirect_to action: :index, id: @subcategory.category_id

	end

	private
	def subcategory_params
		params.require(:subcategory).permit(:name) 

	end
end
