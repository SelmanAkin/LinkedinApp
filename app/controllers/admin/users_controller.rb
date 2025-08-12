class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def index
    @users = User.all.order(:created_at)
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user
      redirect_to admin_users_path, alert: "Kendini silemezsin!"
    else
      user.destroy
      redirect_to admin_users_path, notice: "Kullanıcı silindi."
    end
  end

  private

  def require_admin!
    redirect_to root_path, alert: "Yetkiniz yok." unless current_user.admin?
  end
end
