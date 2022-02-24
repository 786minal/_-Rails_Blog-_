class CommentsController < ApplicationController
   before_action :find_article
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
   redirect_to article_path(@article)
   
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit( :rating, :description, :user_id)
    end
      def find_article
       @article = Article.find(params[:article_id])
    end
end
