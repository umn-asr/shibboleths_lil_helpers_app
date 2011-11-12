class CreateSlhSitePaths < ActiveRecord::Migration
  def change
    create_table :slh_site_paths do |t|
      t.string :name
      t.belongs_to :slh_site
      t.string :flavor
      t.text :specific_users

      t.timestamps
    end
    add_index :slh_site_paths, :slh_site_id
  end
end
