class Product < ApplicationRecord
  has_many_attached :photos
  categories = ['Computers', 'Phones & Mobile Tech', 'Cameras', 'Gaming', 'Music', 'Home', 'Drones', 'Other']
  condition = ['Like New', 'Normal Wear', 'Minor Cosmetic Faults', 'Minor Functional Faults']
  belongs_to :user
  has_many :bookings

  def unavailable_dates
    bookings.pluck(:check_in, :check_out).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  has_many :favourites
  has_many :reviews, through: :bookings, :dependent => :destroy
  has_many_attached :photos
  validates :title, :description, :address, :price, :model, :brand, presence: true
  validates :delivery_method, presence: true, inclusion: { in: ['Pick up', 'Delivery', 'Flexible'] }
  validates :category, presence: true, inclusion: { in: categories }


end
