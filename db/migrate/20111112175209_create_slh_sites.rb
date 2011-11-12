class CreateSlhSites < ActiveRecord::Migration
  def change
    create_table :slh_sites do |t|
      t.string :name
      t.belongs_to :slh_host
      t.boolean :is_key_originator
      t.string :site_id

      t.timestamps
    end
    add_index :slh_sites, :slh_host_id
  end
end
