class CreateCatFosterRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :cat_foster_requests do |t|
      t.integer :cat_id, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.string :status, null: false, default: 'PENDING'
      t.timestamps
    end
    add_index :cat_foster_requests, :cat_id
  end
end
