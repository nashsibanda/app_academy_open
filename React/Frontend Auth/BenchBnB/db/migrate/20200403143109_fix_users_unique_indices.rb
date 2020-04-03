# frozen_string_literal: true

class FixUsersUniqueIndices < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, name: 'index_users_on_username_and_email'
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    # Ex:- add_index("admin_users", "username")
  end
end
