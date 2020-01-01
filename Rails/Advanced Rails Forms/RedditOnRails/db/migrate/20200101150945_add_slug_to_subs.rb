class AddSlugToSubs < ActiveRecord::Migration[6.0]
  def change
    add_column :subs, :slug, :string
    add_index :subs, :slug, unique: true
  end
end
