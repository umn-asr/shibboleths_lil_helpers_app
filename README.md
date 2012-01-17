About
=====
THIS PROJECT IS ABANDONWARE! 
Use https://github.com/umn-asr/shibboleths_lil_helper instead!

This intent of this app was to bring Shibboleth's Lil Helper to the web, instead of using the command line.  
If someone has interest in picking this project up, please let me know,
I'd be happy to tell you what would need to be done to make it happen.

Developers: How to get this puppy running
=========================================
* git clone git@github.com:uofm/shibboleths_lil_helpers_app.git
* cd shibboleths_lil_helpers_app/
* git submodule update --init
* bundle
* rake db:migrate
* STUB_INTERNET_ID=goggins rails s

Goto app,click on the config dir, and paste this into the text area:

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


* You should see the output of shibboleths lil helper on the config dir
  show page

* See TODOs.md for some of the crap that I'm working on to make this
  thing work.


