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
	  @article = Article.find(params[:id])
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
