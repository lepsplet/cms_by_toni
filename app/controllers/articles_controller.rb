class ArticlesController < ApplicationController
  def index
	  @subcategory = Subcategory.find(params[:id])
	  @articles = @subcategory.articles.all
  end

  def show
  end

  def new
	  @subcategory = Subcategory.find(params[:id])
	  @article = @subcategory.articles.build
  end

  def create
	  @subcategory = Subcategory.find(params[:id])
	  @article = @subcategory.articles.build(article_params)

	  if @article.save
		  redirect_to action: :index, id: @article.subcategory_id
		  else
			  render :new
		  end

  end


  def edit
  end
end
