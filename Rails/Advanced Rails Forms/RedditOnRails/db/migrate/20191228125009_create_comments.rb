class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.references :post, index: true, foreign_key: true
      t.integer :parent_comment_id
      t.timestamps
    end
    add_index :comments, :parent_comment_id
  end
end
