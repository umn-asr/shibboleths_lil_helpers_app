require 'test_helper'

class SlhStrategiesControllerTest < ActionController::TestCase
  setup do
    @slh_strategy = slh_strategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slh_strategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slh_strategy" do
    assert_difference('SlhStrategy.count') do
      post :create, :slh_strategy => @slh_strategy.attributes
    end

    assert_redirected_to slh_strategy_path(assigns(:slh_strategy))
  end

  test "should show slh_strategy" do
    get :show, :id => @slh_strategy.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @slh_strategy.to_param
    assert_response :success
  end

  test "should update slh_strategy" do
    put :update, :id => @slh_strategy.to_param, :slh_strategy => @slh_strategy.attributes
    assert_redirected_to slh_strategy_path(assigns(:slh_strategy))
  end

  test "should destroy slh_strategy" do
    assert_difference('SlhStrategy.count', -1) do
      delete :destroy, :id => @slh_strategy.to_param
    end

    assert_redirected_to slh_strategies_path
  end
end
