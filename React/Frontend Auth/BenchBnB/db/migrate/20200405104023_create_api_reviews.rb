# frozen_string_literal: true

class CreateApiReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :api_reviews do |t|
      t.integer :rating, null: false
      t.text :comment, null: false
      t.references :api_bench, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
