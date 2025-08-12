class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to post_path(@post), notice: "Yorum eklendi."
    else
      redirect_to post_path(@post), alert: "Yorum başarısız."
    end
  end
  def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  
  if @comment.user == current_user
    @comment.destroy
    redirect_to post_path(@post), notice: "Yorum silindi."
  else
    redirect_to post_path(@post), alert: "Bu yorumu silme yetkin yok."
  end
end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
