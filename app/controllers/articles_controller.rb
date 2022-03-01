class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 4)
  end
  def show
    if @article.blank?
      @average_comment = 0
    else
      @average_comment = Comment.where(article_id: @article.id).average(:rating)
    end
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
  def edit; end
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @article.destroy
    redirect_to root_path
  end
private
  def article_params
   params.require(:article).permit(:user_id, :Tittle, :description, :image)
  end
  def set_article
    @article = current_user.articles.find(params[:id])
  end
end