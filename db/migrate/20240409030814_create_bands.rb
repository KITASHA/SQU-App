class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :part_name  # パートの名前
      t.string :band_member  # バンドメンバーのニックネーム

      t.timestamps
    end
  end
end