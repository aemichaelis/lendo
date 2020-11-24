class Review < ApplicationRecord
  belongs_to :product
  belongs_to :booking
  has_one :user, through: :booking

  validates :product, :booking, :description, :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
