class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.string :body
      t.boolean :done, null: false
      t.date :due
    end
    add_index :todos, :title
  end
end
