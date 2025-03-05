class ChangeUserNullConstraintOnBands < ActiveRecord::Migration[7.0]
  def change
    change_column_null :bands, :user_id, true
  end
end
