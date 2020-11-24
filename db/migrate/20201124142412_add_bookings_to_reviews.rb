class AddBookingsToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :bookings, null: false, foreign_key: true
  end
end
