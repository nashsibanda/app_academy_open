class AddUserIdToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :user_id, :integer
    add_index :likes, :user_id
  end
end
