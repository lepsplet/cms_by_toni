class CategoriesController < ApplicationController
	before_action :authenticate_user!

	add_breadcrumb "Domov", :categories_path

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			redirect_to categories_path
			flash[:notice] = "Uspešno ste ustvarili novo kategorijo #{@category.name}" 
		else
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			redirect_to categories_path
			flash[:notice] = "Uspešno ste spremenili  kategorijo v #{@category.name}" 
			else
				render 'edit'
			end
	end
	 def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
		flash[:notice] = "Uspešno ste izbrisali  kategorijo #{@category.name}" 
	 end

	private
	def category_params
		params.require(:category).permit(:name) 

	end
end
