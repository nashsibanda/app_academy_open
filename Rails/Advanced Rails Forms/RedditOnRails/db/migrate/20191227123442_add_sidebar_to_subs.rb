class AddSidebarToSubs < ActiveRecord::Migration[6.0]
  def change
    add_column :subs, :sidebar, :text
  end
end
