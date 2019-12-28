class RenameCrosspostsParentColumnInPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :crosspost_parent, :crosspost_parent_id
  end
end
