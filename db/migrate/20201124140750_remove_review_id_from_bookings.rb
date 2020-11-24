class RemoveReviewIdFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_columns :bookings, :review_id
  end
end
