class CreateSlhStrategies < ActiveRecord::Migration
  def change
    create_table :slh_strategies do |t|
      t.string :name
      t.belongs_to :slh_config_dir
      t.string :sp_entity_id
      t.string :idp_metadata_url
      t.string :error_support_contact

      t.timestamps
    end
    add_index :slh_strategies, :slh_config_dir_id
  end
end
