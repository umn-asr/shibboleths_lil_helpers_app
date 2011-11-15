class SlhConfigDir < ActiveRecord::Base
  belongs_to :user
  has_many :slh_strategies

  def config_dot_rb_line_regexes
    require 'uri'

    # http://stackoverflow.com/questions/1156601/whats-the-state-of-the-art-in-email-validation-for-rails
    email_regex = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
    email_string = /'#{email_regex}'/
    url_string = /'#{URI::regexp}'/
    string = /'.+?'/
    space  = /\s*?/
    symbol = /:\w+?/
    true_or_false = /true|false/
    {'Slh.for_strategy' => /^#{space}Slh.for_strategy#{space}#{symbol}#{space}do#{space}$/,
     'set :any_symbol, \'any_string\'' => /^#{space}set#{space}#{symbol}#{space},#{space}#{string}#{space}$/,
     'set :any_symbol, :any_symbol' => /^#{space}set#{space}#{symbol}#{space},#{space}#{symbol}#{space}$/,
     'set :any_symbol, true or false' => /^#{space}set#{space}#{symbol}#{space},#{space}#{true_or_false}#{space}$/,
     'comment' => /^#{space}\#/,
     'white space' => /^#{space}$/,
     'end statement' => /^#{space}end#{space}$/,
     'for_apache_host or for_iis_host' => /^#{space}for_apache_host|for_iis_host#{space}#{string}#{space}do#{space}$/,
     'for_site' => /^#{space}for_site#{space}#{string}#{space}do#{space}$/,
     'protect_with_block' => /^#{space}protect#{space}#{string}#{space}do#{space}$/
    }
  end
  validate do
    self.config_dot_rb.each_line do |line|
      if self.config_dot_rb_line_regexes.values.any? {|regex| regex.match(line)}
        # We all good
      else
        errors.add(:config_dot_rb, "Sorry, #{line}, does not match any of the DSL rules")
      end
    end
  end

  before_save :write_config_dot_rb
  before_save :write_slh_describe
  before_save :write_slh_generate
  before_save :write_slh_verify_metadata
  before_save :write_slh_generate_metadata
  before_save :generate_tarball

  def write_config_dot_rb
    require 'fileutils'
    da_dir = File.join(self.dir_path,'shibboleths_lil_helper')
    FileUtils.mkdir_p da_dir
    File.open(File.join(da_dir,'config.rb'),'w') do |f|
      f.print self.config_dot_rb
    end 
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

  def generate_tarball_command
    "cd #{File.join(Rails.root, 'slh_config_dirs')} && tar cvzf #{self.id.to_s}.tar.gz #{self.id.to_s}/"
  end

  def generate_tarball
    the_command_string = self.generate_tarball_command
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
    # TODO: write some output from the tarball command
    # write_attribute(command_sym, v)
  end

  def download_tarball_file_name
    "#{self.id.to_s}_#{self.name}.tar.gz"
   end
  protected
    def slh_binary
      File.join(Rails.root,'lib','shibboleths_lil_helper','bin','slh')
    end

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
    def tarball_path
      File.join(Rails.root, 'slh_config_dirs',"#{self.id.to_s}.tar.gz")
    end
end
