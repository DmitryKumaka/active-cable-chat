class CreateRooms < ActiveRecord::Migration[5.0]
  def up
    create_table :rooms do |t|
      t.integer :message_id
      t.integer :user_id
      t.timestamps
    end
    drop_table :messages_users
  end
end
