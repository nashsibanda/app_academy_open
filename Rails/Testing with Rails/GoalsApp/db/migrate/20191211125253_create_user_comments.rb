class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.integer :commenter_id, null: false
      t.integer :commented_id, null: false
      t.text :text, null: false
      t.timestamps
    end
    add_index :user_comments, :commenter_id
    add_index :user_comments, :commented_id
  end
end
