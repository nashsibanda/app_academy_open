class RemoveAndAddFieldsForUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove_index :name
      t.remove :name
      t.remove :email
      t.column :username, :string, null: false
    end
    add_index :users, :username, unique: true
  end
end
