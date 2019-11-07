class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author_id, null: false
    end
    add_index :polls, :title
  end
end
