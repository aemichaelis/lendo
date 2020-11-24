class ChangeAccessoriesTypoInProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :accessoires, :accessories
  end
end
