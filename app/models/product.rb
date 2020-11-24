class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  has_many :favourites
  has_many :reviews, through: :bookings
end
