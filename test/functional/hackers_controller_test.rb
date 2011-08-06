require 'test_helper'

class HackersControllerTest < ActionController::TestCase
  setup do
    @hacker = hackers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hackers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hacker" do
    assert_difference('Hacker.count') do
      post :create, :hacker => @hacker.attributes
    end

    assert_redirected_to hacker_path(assigns(:hacker))
  end

  test "should show hacker" do
    get :show, :id => @hacker.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hacker.to_param
    assert_response :success
  end

  test "should update hacker" do
    put :update, :id => @hacker.to_param, :hacker => @hacker.attributes
    assert_redirected_to hacker_path(assigns(:hacker))
  end

  test "should destroy hacker" do
    assert_difference('Hacker.count', -1) do
      delete :destroy, :id => @hacker.to_param
    end

    assert_redirected_to hackers_path
  end
end
