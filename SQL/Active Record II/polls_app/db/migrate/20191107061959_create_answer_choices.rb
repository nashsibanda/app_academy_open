class CreateAnswerChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.string :text, null: false
      t.timestamps
    end
    add_index :answer_choices, :text
  end
end
