class Booking < ApplicationRecord
  belongs_to :product, :user
end
