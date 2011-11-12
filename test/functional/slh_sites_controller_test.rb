require 'test_helper'

class SlhSitesControllerTest < ActionController::TestCase
  setup do
    @slh_site = slh_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slh_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slh_site" do
    assert_difference('SlhSite.count') do
      post :create, :slh_site => @slh_site.attributes
    end

    assert_redirected_to slh_site_path(assigns(:slh_site))
  end

  test "should show slh_site" do
    get :show, :id => @slh_site.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @slh_site.to_param
    assert_response :success
  end

  test "should update slh_site" do
    put :update, :id => @slh_site.to_param, :slh_site => @slh_site.attributes
    assert_redirected_to slh_site_path(assigns(:slh_site))
  end

  test "should destroy slh_site" do
    assert_difference('SlhSite.count', -1) do
      delete :destroy, :id => @slh_site.to_param
    end

    assert_redirected_to slh_sites_path
  end
end
