# frozen_string_literal: true

class AddSeatingToApiBenches < ActiveRecord::Migration[6.0]
  def change
    add_column :api_benches, :seating, :integer, default: 1, null: false
  end
end
