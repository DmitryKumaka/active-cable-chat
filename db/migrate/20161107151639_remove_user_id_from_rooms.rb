class RemoveUserIdFromRooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :rooms, :user_id, :integer
    remove_column :rooms, :message_id, :integer
    add_column :messages, :room_id, :integer
    add_column :messages, :user_id, :integer
  end
end
