class CreateSites < ActiveRecord::Migration[7.1]
  def change
    create_table :sites do |t|
      t.string :long_url
      t.string :little_url

      t.timestamps
    end
  end
end
