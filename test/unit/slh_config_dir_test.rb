require 'test_helper'

class SlhConfigDirTest < ActiveSupport::TestCase
  test "Fixtures are setup right" do
    assert_equal @config1.name, 'config1'
    assert @config1.slh_strategies.length > 0
    assert !@test_idp.nil?
    assert !@host1.nil?
    assert !@site1.nil?
    assert !@site_path1.nil?
  end

  test "generate_config_dot_rb works" do
    config_dot_rb = @config1.generate_config_dot_rb
    assert_match /for_strategy/, config_dot_rb
    assert_match /set :sp_entity_id/, config_dot_rb
    assert_match /set :idp_metadata_url/, config_dot_rb
    assert_match /set :error_support_contact/, config_dot_rb
    assert_match /for_apache_host/, config_dot_rb
  end
end
