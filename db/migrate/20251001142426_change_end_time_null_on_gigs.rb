class ChangeEndTimeNullOnGigs < ActiveRecord::Migration[7.2]
  def change
     change_column_null :gigs, :end_time, true
  end
end
