class UsersInRooms < ActiveRecord::Migration
  def change
    create_table :users_in_rooms, :id => false do |t|
      t.references :user
      t.references :room
    end
    add_index :users_in_rooms, [:user_id, :room_id]
  end
end
