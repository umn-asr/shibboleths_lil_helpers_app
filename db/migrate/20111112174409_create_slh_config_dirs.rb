class CreateSlhConfigDirs < ActiveRecord::Migration
  def change
    create_table :slh_config_dirs do |t|
      t.string :name
      t.belongs_to :user
      t.text :config_dot_rb
      t.text :slh_describe
      t.text :slh_generate
      t.datetime :slh_generate_updated_at
      t.text :slh_verify_metadata
      t.datetime :slh_verify_metadata_updated_at
      t.text :slh_generate_metadata
      t.datetime :slh_generate_metadata_updated_at

      t.timestamps
    end
    add_index :slh_config_dirs, :user_id
  end
end
