class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :category
      t.string :availibilty
      t.integer :price
      t.string :accessoires
      t.string :condition
      t.string :model
      t.string :brand
      t.string :delivery_method
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
