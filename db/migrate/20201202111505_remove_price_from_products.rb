class RemovePriceFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_columns :products, :price
  end
end
