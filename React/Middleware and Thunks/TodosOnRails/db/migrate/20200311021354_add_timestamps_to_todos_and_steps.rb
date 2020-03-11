# frozen_string_literal: true

class AddTimestampsToTodosAndSteps < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :todos, null: true
    add_timestamps :steps, null: true
  end
end
