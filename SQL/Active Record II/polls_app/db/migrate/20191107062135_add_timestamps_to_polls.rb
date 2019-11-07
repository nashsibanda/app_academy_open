class AddTimestampsToPolls < ActiveRecord::Migration[6.0]
  def change
    change_table(:polls) { |t| t.timestamps }
  end
end
