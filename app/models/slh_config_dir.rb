class SlhConfigDir < ActiveRecord::Base
  belongs_to :user
  has_many :slh_strategies

  # before_save :generate_config_dot_rb
  #before_save :write_config_dot_rb
  before_save :write_slh_describe
  before_save :write_slh_generate
  before_save :write_slh_verify_metadata
  before_save :write_slh_generate_metadata

  TEMPLATE =<<-EOS
<% self.slh_strategies.each do |slh_strategy| %>
Slh.for_strategy :<%= slh_strategy.name %> do
  set :sp_entity_id, '<%= slh_strategy.sp_entity_id %>'
  set :idp_metadata_url, '<%= slh_strategy.idp_metadata_url %>'
  set :error_support_contact, '<%= slh_strategy.error_support_contact %>'
  <% slh_strategy.slh_hosts.each do |slh_host| %>
    <%= slh_host.host_type == 'apache' ? "for_apache_host" : "for_iis_host" %> '<%= slh_host.name %>' do
      <% slh_host.slh_sites.each do |slh_site| %>
        for_site '<%= slh_site.name %>' do
          <%= slh_site.is_key_originator ? "set :is_key_originator, true" : "" %>
          <% slh_site.slh_site_paths.each do |slh_site_path| %>
            protect '<%= slh_site_path.name %>' do
              set :flavor, :<%= slh_site_path.flavor %>
            end
          <% end %>
        end
      <% end %>
    end
  <% end %>
end
<% end %>
  EOS

  # def generate_config_dot_rb
  #   self.config_dot_rb = ERB.new(TEMPLATE).result(binding)
  # end

  # def write_config_dot_rb
  #   require 'fileutils'
  #   da_dir = File.join(self.dir_path,'shibboleths_lil_helper')
  #   FileUtils.mkdir_p da_dir
  #   File.open(File.join(da_dir,'config.rb'),'w') do |f|
  #     f.print self.config_dot_rb
  #   end 
  # end

  def slh_binary
    File.join(Rails.root,'lib','shibboleths_lil_helper','bin','slh')
  end

  def write_slh_describe
    self.write_output_from_command(:slh_describe)
  end

  def write_slh_generate
    self.write_output_from_command(:slh_generate)
  end

  def write_slh_verify_metadata
    self.write_output_from_command(:slh_verify_metadata)
  end

  def write_slh_generate_metadata
    self.write_output_from_command(:slh_generate_metadata)
  end
  protected
    def command_strings(command_sym)
      t=command_sym.to_s.gsub(/^slh_/,'')
      "#{slh_command_prefix} #{t}"
    end

    def write_output_from_command(command_sym)
      the_command_string = self.command_strings(command_sym)
      stdout_str = ""
      stderr_str = ""
      unless
        Open4::popen4(the_command_string) { |pid, stdin, stdout, stderr|
          stderr_str = stderr.read
          stdout_str = stdout.read
          true
        }
         raise "COULD NOT do #{the_command_string}"
      end
      v = stdout_str
      unless stderr_str.blank?
        v += "STDERR:\n"
        v += stderr_str
      end
      write_attribute(command_sym, v)
    end

    def slh_command_prefix
      "cd #{self.dir_path} && #{self.slh_binary} "
    end
    def dir_path
      File.join(Rails.root, 'slh_config_dirs',self.id.to_s)
    end
end
