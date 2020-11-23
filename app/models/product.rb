class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings, :favourites
  has_many :reviews, through: :bookings
end
