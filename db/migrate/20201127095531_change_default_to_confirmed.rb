class ChangeDefaultToConfirmed < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :confirmed, "pending"
  end
end
