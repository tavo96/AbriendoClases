require 'test_helper'

class UserInRequestsControllerTest < ActionController::TestCase
  setup do
    @user_in_request = user_in_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_in_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_in_request" do
    assert_difference('UserInRequest.count') do
      post :create, user_in_request: { request_id: @user_in_request.request_id, user_id: @user_in_request.user_id }
    end

    assert_redirected_to user_in_request_path(assigns(:user_in_request))
  end

  test "should show user_in_request" do
    get :show, id: @user_in_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_in_request
    assert_response :success
  end

  test "should update user_in_request" do
    patch :update, id: @user_in_request, user_in_request: { request_id: @user_in_request.request_id, user_id: @user_in_request.user_id }
    assert_redirected_to user_in_request_path(assigns(:user_in_request))
  end

  test "should destroy user_in_request" do
    assert_difference('UserInRequest.count', -1) do
      delete :destroy, id: @user_in_request
    end

    assert_redirected_to user_in_requests_path
  end
end
