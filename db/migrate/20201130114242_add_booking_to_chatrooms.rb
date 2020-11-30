class AddBookingToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :booking, foreign_key: true
  end
end
