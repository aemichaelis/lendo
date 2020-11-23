class Favourite < ApplicationRecord
  belongs_to :user, :product
end
