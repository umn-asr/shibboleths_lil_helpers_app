class SlhSite < ActiveRecord::Base
  belongs_to :slh_host
  has_many :slh_site_paths
end
