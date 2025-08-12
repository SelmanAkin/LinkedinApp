class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar


  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id", dependent: :destroy

 
  has_many :connections, dependent: :destroy
  has_many :friends, through: :connections

  has_many :received_connections, class_name: "Connection", foreign_key: "friend_id", dependent: :destroy
  has_many :requesters, through: :received_connections, source: :user

  def confirmed_friends
    connections.where(status: "accepted").map(&:friend) +
    received_connections.where(status: "accepted").map(&:user)
  end

  def pending_requests
    connections.where(status: "pending")
  end

  def received_requests
    received_connections.where(status: "pending")
  end
end