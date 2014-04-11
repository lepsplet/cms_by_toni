class ArticlesController < ApplicationController
	before_action :authenticate_user!
	add_breadcrumb "Domov", :categories_path

  def index
	  @subcategory = Subcategory.find(params[:id])
	  @articles = @subcategory.articles.all
	  @category = Category.find(@subcategory.category_id) #to je za breadchrumps
	  add_breadcrumb @category.name, controller: 'subcategories', action: 'index', id: @category.id
	  add_breadcrumb @subcategory.name, action: 'index', id: @subcategory.id
  end

  def new
	  @subcategory = Subcategory.find(params[:id])
	  @article = @subcategory.articles.build
	  @category = Category.find(@subcategory.category_id) #to je za breadchrumps
	  add_breadcrumb @category.name, controller: 'subcategories', action: 'index', id: @category.id
	  add_breadcrumb @subcategory.name, action: 'index', id: @subcategory.id
  end

  def create
	  @subcategory = Subcategory.find(params[:id])
	  @article = @subcategory.articles.build(article_params)
	  @category = Category.find(@subcategory.category_id) #to je za breadchrumps
	  add_breadcrumb @category.name, controller: 'categories', action: 'index', id: @category.id
	  add_breadcrumb @subcategory.name, action: 'index', id: @subcategory.id

	  if @article.save
		  redirect_to action: :index, id: @article.subcategory_id
		  else
			  render :new
		  end

  end


  def edit
	  @article = Article.find(params[:id])
	  @subcategory = Subcategory.find(@article.subcategory_id)
	  @category = Category.find(@subcategory.category_id) #to je za breadchrumps
	  add_breadcrumb @category.name, controller: 'subcategories', action: 'index', id: @category.id
	  add_breadcrumb @subcategory.name, action: 'index', id: @subcategory.id
	  add_breadcrumb @article.name, action: 'edit', id: @article.id
  end

  def update
	  @article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to action: :index, id: @article.subcategory_id 
			else
				render 'edit'
		end
  end

  def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to action: :index, id: @article.subcategory_id

  end
	private
	def article_params
		params.require(:article).permit(:name, :body) 

	end
end
