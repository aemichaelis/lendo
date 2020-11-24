class Product < ApplicationRecord
  categories = ['Computers', 'Phones & Mobile Tech', 'Cameras', 'Gaming', 'Music', 'Home', 'Drones', 'Other']
  condition = ['Like New', 'Normal Wear', 'Minor Cosmetic Faults', 'Minor Functional Faults']
  belongs_to :user
  has_many :bookings
  has_many :favourites
  has_many :reviews, through: :bookings
  validates :title, :description, :address, :price, :model, :brand, presence: true
  validates :delivery_method, presence: true, inclusion: { in: ['Pick up', 'Delivery', 'Flexible'] }
  validates :category, presence: true, inclusion: { in: categories }
  validates :condition, presence: true, inclusion: { in: condition }
end
