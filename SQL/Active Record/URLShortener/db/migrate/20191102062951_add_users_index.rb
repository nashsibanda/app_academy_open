class AddUsersIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :visits, :user_id
  end
end
