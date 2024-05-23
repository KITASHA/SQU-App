class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :band_name, null: false, limit: 30
      t.text :members
      t.text :description, null: false
      t.string :link_name
      t.string :link_url
      t.references :user, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
