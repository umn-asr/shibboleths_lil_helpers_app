rails c
require 'sandbox'
s=Sandbox.safe
s.eval("$LOAD_PATH << 'lib/shibboleths_lil_helper/lib/'")
s.require 'lib/shibboleths_lil_helper/lib/shibboleths_lil_helper.rb'
puts s.eval("Slh::Cli.documentation")
t=<<-EOS
  Slh.for_strategy :test_idp do
    set :sp_entity_id, 'https://asr.umn.edu/shibboleth/default'
    set :idp_metadata_url, 'https://idp-test.shib.umn.edu/metadata.xml'
    set :error_support_contact, 'goggins@umn.edu'
    
      for_apache_host 'asr-web-dev4.oit.umn.edu' do
        
          for_site 'shib-rails2-test.asr.umn.edu' do
            set :is_key_originator, true
            
              protect '/' do
                set :flavor, :authentication_optional
              end
            
          end
        
      end
    
  end
EOS

s.eval(t)
s.eval("ARGV << 'describe'")
s.eval("Slh.is_loaded!")
# s.activate!
s.eval("Slh::Cli.execute")


# s.activate!
