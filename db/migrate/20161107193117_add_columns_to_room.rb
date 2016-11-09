class AddColumnsToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :sender_id, :integer
    add_column :rooms, :recipient_id, :integer
    add_index  :rooms, :sender_id
    add_index  :rooms, :recipient_id
  end
end
