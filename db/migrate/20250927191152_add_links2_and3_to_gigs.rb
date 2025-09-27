class AddLinks2And3ToGigs < ActiveRecord::Migration[7.2]
  def change
    add_column :gigs, :link_name_2, :string
    add_column :gigs, :link_url_2, :string
    add_column :gigs, :link_name_3, :string
    add_column :gigs, :link_url_3, :string
  end
end
