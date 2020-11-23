class Review < ApplicationRecord
  belongs_to :product, :booking
  has_one :user, through: :booking
end
