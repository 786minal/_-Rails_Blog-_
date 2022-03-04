class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!, except: [:index, :show]
  before_action :author, only: [:edit, :update, :destroy]
  def index
     if params[:search_key]
      @articles = Article.where("Tittle LIKE ? OR description LIKE ?","%#{params[:search_key]}%", "%#{params[:search_key]}%").paginate(:page => params[:page], :per_page => 4)
    else
      @articles = Article.paginate(:page => params[:page], :per_page => 4)
    end 
  end
  def show
    @article = Article.find(params[:id])
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

  def edit
   
  end

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
  def author
   
    redirect_to articles_path, notice: "Not Authorized To Edit This Article" unless @article.user_id==current_user.id
      
  end

private
  def article_params

   params.require(:article).permit(:user_id, :Tittle, :description, :image)
  end

  def set_article
    @article = Article.find(params[:id])
  end
 end