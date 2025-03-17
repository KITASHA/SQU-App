class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :band_name, null: false, limit: 30
      t.string :member_1
      t.string :member_2
      t.string :member_3
      t.string :member_4
      t.string :member_5
      t.string :member_6
      t.string :member_7
      t.string :member_8
      t.string :member_9
      t.text :description, null: false
      t.string :link_name_1
      t.string :link_url_1
      t.string :link_name_2
      t.string :link_url_2
      t.string :link_name_3
      t.string :link_url_3
      t.string :link_name_4
      t.string :link_url_4

      t.timestamps
    end
  end
end
