class NewsController < ApplicationController

	layout 'news'

	add_breadcrumb "Domov", :root_path

	def index
		@categories = Category.all
	end

	def show

		@categories = Category.all

		@subcategories = Subcategory.find(params[:id])
		@articles = @subcategories.articles

		add_breadcrumb @subcategories.name, news_path

	end
end
