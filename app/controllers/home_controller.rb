class HomeController < ApplicationController
  def index
    @post = Post.new if user_signed_in?
    @feed_posts = Post.includes(:user, :likes, :comments).order(created_at: :desc)
    @users = User.where.not(id: current_user&.id).order(:name)
  end
end
