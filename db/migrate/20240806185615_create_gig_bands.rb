class CreateGigBands < ActiveRecord::Migration[7.0]
  def change
    create_table :gig_bands do |t|
      t.references :gig, null: false, foreign_key: true
      t.references :band, null: false, foreign_key: true
      t.timestamps
    end
  end
end
