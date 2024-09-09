class AddLocationToGigs < ActiveRecord::Migration[7.2]
  def change
    add_column :gigs, :location, :string
  end
end
