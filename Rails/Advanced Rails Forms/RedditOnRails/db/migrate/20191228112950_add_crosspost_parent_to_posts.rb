class AddCrosspostParentToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :crosspost_parent, :integer
    add_index :posts, :crosspost_parent
  end
end
