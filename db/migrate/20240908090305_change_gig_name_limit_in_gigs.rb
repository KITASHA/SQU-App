class ChangeGigNameLimitInGigs < ActiveRecord::Migration[7.0]
  def change
    change_column :gigs, :gig_name, :string, limit: 50
  end
end
