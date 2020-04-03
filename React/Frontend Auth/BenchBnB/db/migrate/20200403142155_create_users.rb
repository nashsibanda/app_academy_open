# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token
      t.string :email, null: false
    end
    add_index :users, %i[username email], unique: true
  end
end
