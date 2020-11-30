class AddP1AndP2ToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :p1_id, :integer
    add_column :chatrooms, :p2_id, :integer
    add_index :chatrooms, :p1_id
    add_index :chatrooms, :p2_id
    add_index :chatrooms, [:p1_id, :p2_id], unique: true
  end
end
