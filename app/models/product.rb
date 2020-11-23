class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favourites
  has_many :reviews, through: :bookings
end
