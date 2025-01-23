class CreateReleases < ActiveRecord::Migration[7.2]
  def change
    create_table :releases do |t|
      t.string :title
      t.text :body
      t.string :form_url
      t.string :image
      t.boolean :selected, default: false

      t.timestamps
    end
  end
end
