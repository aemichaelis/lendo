class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :category
      t.string :accessories
      t.string :model
      t.string :brand
      t.string :delivery_method
      t.monetize :amount, currency: { present: false }
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
