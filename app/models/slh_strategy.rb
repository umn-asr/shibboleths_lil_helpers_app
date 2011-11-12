class SlhStrategy < ActiveRecord::Base
  belongs_to :slh_config_dir
  has_many :slh_hosts
end
