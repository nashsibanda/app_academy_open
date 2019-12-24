class CreateModeratorModeratedSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :moderator_moderated_subs do |t|
      t.references :moderator, index: true, foreign_key: { to_table: :users }
      t.references :sub, index: true, foreign_key: true
    end
  end
end
