class AddFormTextToReleases < ActiveRecord::Migration[7.2]
  def change
    add_column :releases, :form_text, :text
  end
end
