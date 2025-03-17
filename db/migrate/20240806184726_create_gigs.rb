class CreateGigs < ActiveRecord::Migration[7.0]
  def change
    create_table :gigs do |t|
      t.string :gig_name, null: false, limit: 50
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.text :description, null: false
      t.string :link_name
      t.string :link_url
      t.timestamps
    end
  end
end

