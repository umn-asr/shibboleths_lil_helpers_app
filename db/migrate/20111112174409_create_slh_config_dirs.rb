class CreateSlhConfigDirs < ActiveRecord::Migration
  def change
    create_table :slh_config_dirs do |t|
      t.string :name
      t.belongs_to :user
      t.text :config_dot_rb
      t.text :slh_describe
      t.text :slh_generate
      t.text :slh_verify_metadata
      t.text :slh_generate_metadata
      t.string :permanent_dir_name

      t.timestamps
    end
    add_index :slh_config_dirs, :user_id
  end
end
