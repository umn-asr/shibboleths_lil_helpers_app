# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111112175209) do

  create_table "slh_config_dirs", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "config_dot_rb"
    t.text     "slh_describe"
    t.text     "slh_generate"
    t.datetime "slh_generate_updated_at"
    t.text     "slh_verify_metadata"
    t.datetime "slh_verify_metadata_updated_at"
    t.text     "slh_generate_metadata"
    t.datetime "slh_generate_metadata_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slh_config_dirs", ["user_id"], :name => "index_slh_config_dirs_on_user_id"

  create_table "slh_hosts", :force => true do |t|
    t.string   "name"
    t.integer  "slh_strategy_id"
    t.string   "host_type"
    t.string   "shib_prefix"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slh_hosts", ["slh_strategy_id"], :name => "index_slh_hosts_on_slh_strategy_id"

  create_table "slh_site_paths", :force => true do |t|
    t.string   "name"
    t.integer  "slh_site_id"
    t.string   "flavor"
    t.text     "specific_users"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slh_site_paths", ["slh_site_id"], :name => "index_slh_site_paths_on_slh_site_id"

  create_table "slh_sites", :force => true do |t|
    t.string   "name"
    t.integer  "slh_host_id"
    t.boolean  "is_key_originator"
    t.string   "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slh_sites", ["slh_host_id"], :name => "index_slh_sites_on_slh_host_id"

  create_table "slh_strategies", :force => true do |t|
    t.string   "name"
    t.integer  "slh_config_dir_id"
    t.string   "sp_entity_id"
    t.string   "idp_metadata_url"
    t.string   "error_support_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slh_strategies", ["slh_config_dir_id"], :name => "index_slh_strategies_on_slh_config_dir_id"

  create_table "users", :force => true do |t|
    t.string   "internet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
