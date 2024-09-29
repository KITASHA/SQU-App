class AddSlugToBands < ActiveRecord::Migration[7.2]
  def change
    add_column :bands, :slug, :string
    add_index :bands, :slug, unique: true
  end
end
