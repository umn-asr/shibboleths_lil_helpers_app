require 'test_helper'

class SlhHostsControllerTest < ActionController::TestCase
  setup do
    @slh_host = slh_hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slh_hosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slh_host" do
    assert_difference('SlhHost.count') do
      post :create, :slh_host => @slh_host.attributes
    end

    assert_redirected_to slh_host_path(assigns(:slh_host))
  end

  test "should show slh_host" do
    get :show, :id => @slh_host.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @slh_host.to_param
    assert_response :success
  end

  test "should update slh_host" do
    put :update, :id => @slh_host.to_param, :slh_host => @slh_host.attributes
    assert_redirected_to slh_host_path(assigns(:slh_host))
  end

  test "should destroy slh_host" do
    assert_difference('SlhHost.count', -1) do
      delete :destroy, :id => @slh_host.to_param
    end

    assert_redirected_to slh_hosts_path
  end
end
