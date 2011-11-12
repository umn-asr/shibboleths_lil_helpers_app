class SlhConfigDir < ActiveRecord::Base
  belongs_to :user
  has_many :slh_strategies

  TEMPLATE =<<-EOS
<% self.slh_strategies.each do |slh_strategy| %>
Slh.for_strategy :<%= slh_strategy.name %> do
  set :sp_entity_id, '<%= slh_strategy.sp_entity_id %>'
  set :idp_metadata_url, '<%= slh_strategy.idp_metadata_url %>'
  set :error_support_contact, '<%= slh_strategy.error_support_contact %>'
  <% slh_strategy.slh_hosts.each do |slh_host| %>
    <%= slh_host.host_type == 'apache' ? "for_apache_host" : "for_iis_host" %> <%= slh_host.name %> do
    end
  <% end %>
end
<% end %>
  EOS

  def generate_config_dot_rb
    ERB.new(TEMPLATE).result(binding)
  end
end
