require 'test_helper'

class SlhSitePathsControllerTest < ActionController::TestCase
  setup do
    @slh_site_path = slh_site_paths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slh_site_paths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slh_site_path" do
    assert_difference('SlhSitePath.count') do
      post :create, :slh_site_path => @slh_site_path.attributes
    end

    assert_redirected_to slh_site_path_path(assigns(:slh_site_path))
  end

  test "should show slh_site_path" do
    get :show, :id => @slh_site_path.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @slh_site_path.to_param
    assert_response :success
  end

  test "should update slh_site_path" do
    put :update, :id => @slh_site_path.to_param, :slh_site_path => @slh_site_path.attributes
    assert_redirected_to slh_site_path_path(assigns(:slh_site_path))
  end

  test "should destroy slh_site_path" do
    assert_difference('SlhSitePath.count', -1) do
      delete :destroy, :id => @slh_site_path.to_param
    end

    assert_redirected_to slh_site_paths_path
  end
end
