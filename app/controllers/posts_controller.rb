class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_post!, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: "Paylaşıldı!"
    else
      redirect_to root_path, alert: "Paylaşım başarısız."
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post güncellendi."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post silindi."
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    unless @post
      redirect_to root_path, alert: "Post bulunamadı." and return
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end

  def authorize_post!
    authorize @post
  end
end
