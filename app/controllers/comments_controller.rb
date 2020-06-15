class CommentsController < ApplicationController
  # rails 07 コメント機能　課題
  def new
   @comment = Comment.new
   @topic = Topic.find(params[:topic_id])
  end
  
  def create
   @comment = Comment.new(comment_params)
   @comment.user_id = current_user.id
    if @comment.save
      redirect_to topics_path, success: "コメントを投稿しました"
    else
      flash.now[:danger] = "コメントを投稿できませんでした"
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end
end
