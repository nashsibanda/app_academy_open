class RemoveModeratorIdFromSubs < ActiveRecord::Migration[6.0]
  def change
    remove_column :subs, :moderator_id
  end
end
