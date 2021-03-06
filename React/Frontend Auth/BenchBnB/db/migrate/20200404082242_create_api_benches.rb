# frozen_string_literal: true

class CreateApiBenches < ActiveRecord::Migration[6.0]
  def change
    create_table :api_benches do |t|
      t.string :description, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.timestamps
    end
  end
end
