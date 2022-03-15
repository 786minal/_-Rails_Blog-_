class CommentsController < ApplicationController
   before_action :find_article
   before_action :author, only: [:edit, :update, :destroy]
   skip_before_action :verify_authenticity_token, only: [:create]
def index
  @comment = Comment.all
end

def show
  @comment = Comment.find(params[:id])
end

  def new
  end
  def create
    @comment = @article.comments.build(comment_params)
    @comment.save
   flash[:success] = "Comment successfully added"
   respond_to do |format|
    format.js  { render :layout => false,  :locals => {comment: @comment}  }
     format.html { redirect_to article_path(@article)}    
    end
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
     format.html { redirect_to article_path(@article)}    
      format.js   { render :layout => false,  :locals => {comment: @comment}  }   
     end
  end
 def author
   
    redirect_to articles_path, notice: "Not Authorized To Edit This Comment" unless @article.user_id==current_user.id
      
  end

  private
    def comment_params
     # params.require(:comment).permit( :rating, :description, :user_id,picture_attributes: [:id , :_destroy])
      params.require(:comment).permit( :rating, :description, :user_id,:pictures_attributes => [:id, :image, :_destroy])
    end

    def find_article
     @article = Article.find(params[:article_id])
    end
end
