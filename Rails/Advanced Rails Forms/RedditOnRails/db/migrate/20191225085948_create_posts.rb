class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.references :sub, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
    add_index :posts, :title
  end
end
