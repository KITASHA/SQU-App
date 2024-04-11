class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.references :song, null: false, foreign_key: true 
      t.integer :band, null: false
      t.string :lead, null: false
      t.string :top, null: false
      t.string :second, null: false
      t.string :third, null: false
      t.string :bass, null: false
      t.string :percussion, null: false

      t.timestamps
    end
  end
end