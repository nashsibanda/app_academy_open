class AddTodoIdToSteps < ActiveRecord::Migration[6.0]
  def change
    add_reference :steps, :todo, foreign_key: true
  end
end
