class RenameLinkColumnsInGigs < ActiveRecord::Migration[7.2]
  def change
    rename_column :gigs, :link_name, :link_name_1
    rename_column :gigs, :link_url,  :link_url_1
  end
end
