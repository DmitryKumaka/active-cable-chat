class AddAppearToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :appear, :boolean
  end
end
