class CreateSlhHosts < ActiveRecord::Migration
  def change
    create_table :slh_hosts do |t|
      t.string :name
      t.belongs_to :slh_strategy
      t.string :host_type
      t.string :shib_prefix

      t.timestamps
    end
    add_index :slh_hosts, :slh_strategy_id
  end
end
