class RemoveUserFromBands < ActiveRecord::Migration[7.2]
  def change
    remove_reference :bands, :user, null: false, foreign_key: true
  end
end
