class CreateGigs < ActiveRecord::Migration[7.0]
  def change
    create_table :gigs do |t|
      t.string :gig_name, null: false, limit: 30
      t.text :description, null: false
      t.string :link_name
      t.string :link_url
      t.references :user, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
