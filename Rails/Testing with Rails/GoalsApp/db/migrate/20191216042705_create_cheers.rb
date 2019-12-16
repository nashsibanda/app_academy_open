class CreateCheers < ActiveRecord::Migration[5.2]
  def change
    create_table :cheers do |t|
      t.integer :cheerer_id, null: false
      t.references :cheerable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
