class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :details
      t.boolean :private, default: false
      t.boolean :completed, default: false
      t.date :deadline

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
