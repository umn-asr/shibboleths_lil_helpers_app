require 'test_helper'

class SlhConfigDirsControllerTest < ActionController::TestCase
  setup do
    @slh_config_dir = slh_config_dirs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slh_config_dirs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slh_config_dir" do
    assert_difference('SlhConfigDir.count') do
      post :create, :slh_config_dir => @slh_config_dir.attributes
    end

    assert_redirected_to slh_config_dir_path(assigns(:slh_config_dir))
  end

  test "should show slh_config_dir" do
    get :show, :id => @slh_config_dir.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @slh_config_dir.to_param
    assert_response :success
  end

  test "should update slh_config_dir" do
    put :update, :id => @slh_config_dir.to_param, :slh_config_dir => @slh_config_dir.attributes
    assert_redirected_to slh_config_dir_path(assigns(:slh_config_dir))
  end

  test "should destroy slh_config_dir" do
    assert_difference('SlhConfigDir.count', -1) do
      delete :destroy, :id => @slh_config_dir.to_param
    end

    assert_redirected_to slh_config_dirs_path
  end
end
