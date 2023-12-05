class AddIndexToSitesLittleUrl < ActiveRecord::Migration[7.1]
  def change
    add_index :sites, :little_url
  end
end
