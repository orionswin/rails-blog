class CommentsController < ApplicationController
  before_action :get_article

  def index
    @comments = @article.comments
  end

  def new
    @comments = @article.comments.build
  end

  def create
    @comments = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_comments_path
    else
      render :new
  end

  private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
