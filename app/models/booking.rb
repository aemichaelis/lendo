require_relative "../validators/availability_validator"
class Booking < ApplicationRecord
  enum status: {pending: 0, upcoming: 1, previous: 2}
  belongs_to :product
  belongs_to :user
  has_one :review
  has_one :chatroom, :dependent => :destroy

<<<<<<< HEAD
  validates :check_in, :check_out, presence: true, availability: true
=======
  validates :check_in, :check_out, presence: true

>>>>>>> 5c018a589cc968e4806b3494fa271e0fab592d5f
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if check_out.blank? || check_in.blank?
    if check_out < check_in
      errors.add(:check_out, "must be after the Checkout Date")
    end
  end
end

#
