class SlhHost < ActiveRecord::Base
  belongs_to :slh_strategy
  has_many :slh_sites
end
