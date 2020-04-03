# frozen_string_literal: true

class ForceUsersSessionToken < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :session_token, false
  end
end
