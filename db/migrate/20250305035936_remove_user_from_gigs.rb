class RemoveUserFromGigs < ActiveRecord::Migration[7.2]
  def change
    remove_reference :gigs, :user, null: false, foreign_key: true
  end
end
