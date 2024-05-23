class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :band_name, null: false, limit: 100
      t.string :members, array: true, limit: 8
      t.text :description, null: false
      t.string :link_name
      t.string :link_url

      t.timestamps
    end
  end
end
