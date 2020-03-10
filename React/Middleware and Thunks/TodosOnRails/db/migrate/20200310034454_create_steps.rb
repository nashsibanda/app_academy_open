# frozen_string_literal: true

class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :title, null: false
      t.string :body
      t.boolean :done, null: false, default: false
    end
    add_index :steps, :title
  end
end
