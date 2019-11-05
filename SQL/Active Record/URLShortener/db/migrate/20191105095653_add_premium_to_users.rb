class AddPremiumToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :premium, :boolean, default: false
    change_column_default :users, :premium, false
  end
end
