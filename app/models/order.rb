class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :booking

  monetize :amount_cents
end
