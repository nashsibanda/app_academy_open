# frozen_string_literal: true

class ChangeUsersNameToUsername < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :username
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
