class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :products
  has_many :favourites
  has_many :reviews, through: :bookings
  has_many :messages, :dependent => :destroy

  has_many :author_chatrooms, foreign_key: :p1_id, class_name: 'chatroom'
  has_many :receiver_chatrooms, foreign_key: :p2_id, class_name: 'chatroom'
end
