class Booking < ApplicationRecord
  enum status: {pending: 0, upcoming: 1, previous: 2}
  belongs_to :product
  belongs_to :user
  has_one :review
end
