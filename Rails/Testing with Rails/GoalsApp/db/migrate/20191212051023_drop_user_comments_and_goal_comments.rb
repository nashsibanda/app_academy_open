class DropUserCommentsAndGoalComments < ActiveRecord::Migration[5.2]
  def up
    drop_table :user_comments
    drop_table :goal_comments
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
