class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :voter_id, null: false
      t.references :votable, polymorphic: true, index: true
    end
  end
end
