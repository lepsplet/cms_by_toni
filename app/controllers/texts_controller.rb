class TextsController < ApplicationController
	layout 'news'

	add_breadcrumb "Domov", :root_path

	def show
		@categories = Category.all
		@article = Article.find(params[:id])
		@subcategorie = Subcategory.find(@article.subcategory_id)

		add_breadcrumb @subcategorie.name, controller: :news, action: :show, id: @subcategorie.id
		add_breadcrumb @article.name, controller: :texts, action: :show, id: @article.id

	end
end
