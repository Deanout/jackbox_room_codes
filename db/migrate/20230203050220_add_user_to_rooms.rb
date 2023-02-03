class AddUserToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :user, null: false, foreign_key: true
  end
end
