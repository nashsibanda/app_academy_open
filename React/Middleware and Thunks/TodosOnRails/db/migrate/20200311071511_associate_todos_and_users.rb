# frozen_string_literal: true

class AssociateTodosAndUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :todos, :user, foreign_key: true
  end
end
