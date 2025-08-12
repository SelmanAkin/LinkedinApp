class MessagesController < ApplicationController
  before_action :authenticate_user!

def index
  @received = current_user.received_messages.includes(:sender).order(created_at: :desc)
  @sent = current_user.sent_messages.includes(:receiver).order(created_at: :desc)
end


  def new
    @user = User.find(params[:user_id])
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.build(message_params)
    if @message.save
      redirect_to messages_path, notice: "Mesaj gönderildi."
    else
      render :new, alert: "Mesaj gönderilemedi."
    end
  end
  
  def destroy
  @message = Message.find(params[:id])
  if @message.sender == current_user
    @message.destroy
    redirect_to messages_path, notice: "Mesaj silindi."
  else
    redirect_to messages_path, alert: "Sadece gönderdiğin mesajı silebilirsin!"
  end
end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
