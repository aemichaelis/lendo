class RemoveAvailabilityFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_columns :products, :availibilty
  end
end
