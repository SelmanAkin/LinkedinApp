class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy, :avatar]
  before_action :authorize_user!, only: [:edit, :update, :avatar]

  def show
    @user = User.find(params[:id])
    authorize @user

    if @user == current_user
      @pending_requests = Connection.where(friend: @user, status: "pending").includes(:user)
    end

    @posts = @user.posts.includes(:likes, :comments)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Profil başarıyla güncellendi."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def avatar
    @user.avatar.purge if @user.avatar.attached?
    redirect_to edit_user_path(@user), notice: "Avatar silindi."
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Kullanıcı silindi."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Yetkin yok." unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :title, :bio, :avatar)
  end
end
