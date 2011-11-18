About
=====
This intent of this app is to bring Shibboleth's Lil Helper to the web
(or to run this app on your own instead of learning the command line stuff)

    https://github.com/uofm/shibboleths_lil_helper

This is a work in progress, wildly unstable.

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





