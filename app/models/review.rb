class Review < ApplicationRecord
  belongs_to :product
  belongs_to :booking
  has_one :user, through: :booking

  validates :booking, :product, presence: true
  validates :description, :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }
  validates :rating, numericality: { only_integer: true }
end
