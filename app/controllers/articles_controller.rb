class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = current_user.articles.build
  end
  
  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      FilterJob.perform_later(@article.id)
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:user_id, :Tittle, :description)
    end
end


