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



symbol = /:\w+?/
string = /'\w+?'/
space  = /\s*?/
set_statement = /set#{space}#{symbol}#{space},#{space}#{symbol}|#{string}/

exploit examples
  set :poop, "#{`ls`}"


http://stackoverflow.com/questions/1156601/whats-the-state-of-the-art-in-email-validation-for-rails

email_regex = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

http://stackoverflow.com/questions/106179/regular-expression-to-match-hostname-or-ip-address
valid_hostname
set_argument = /#{URI::regexp}|#{email_regex}|#{symbol}/

set_symbol = /set #{symbol}, #{symbol}/
set_string = /set #{symbol}, #{
MUST_MATCH = [
/Slh.for_strategy #{symbol} do/,   # Slh.for_strategy :test_idp do 
/set :\w+, '#{URI::regexp}|#{email_regex}|'   # set :sp_entity_id, idp_metadata_url
/set :\w+, :\w+/,             # set :flavor, :authentication_optional
/for_apache_host '#{URL::regexp}' do/,  # for_apache_host 'asr-web-dev4.oit.umn.edu' do

]

%w(Slh.for_strategy 
  set
  for_apache_host 
  for_iis_host 
  for_site 
  protect 
  end
)

MUST_NOT_HAVE =['`','exec','fork']
