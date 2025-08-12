class ConnectionsController < ApplicationController
  before_action :authenticate_user!

  def create
    friend = User.find(params[:friend_id])
    connection = current_user.connections.build(friend: friend, status: 'pending')

    if connection.save
      redirect_to user_path(friend), notice: 'Bağlantı isteği gönderildi.'
    else
      redirect_to user_path(friend), alert: 'İstek gönderilemedi.'
    end
  end

  def update
    connection = Connection.find(params[:id])
    if connection.friend == current_user
      connection.update(status: 'accepted')
      redirect_to user_path(connection.user), notice: 'Bağlantı kabul edildi.'
    else
      redirect_to root_path, alert: 'Yetkisiz işlem.'
    end
  end

  def destroy
    connection = Connection.find(params[:id])
    if connection.user == current_user || connection.friend == current_user
      connection.destroy
      redirect_back fallback_location: root_path, notice: 'Bağlantı silindi.'
    else
      redirect_to root_path, alert: 'Yetkisiz işlem.'
    end
  end
end
