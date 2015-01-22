require 'test_helper'

class PermissionsControllerTest < ActionController::TestCase
  setup do
    @permission = permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create permission" do
    assert_difference('Permission.count') do
      post :create, permission: { condition_id: @permission.condition_id, goal_id: @permission.goal_id, permissible_user_id: @permission.permissible_user_id, user_id: @permission.user_id }
    end

    assert_redirected_to permission_path(assigns(:permission))
  end

  test "should show permission" do
    get :show, id: @permission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @permission
    assert_response :success
  end

  test "should update permission" do
    patch :update, id: @permission, permission: { condition_id: @permission.condition_id, goal_id: @permission.goal_id, permissible_user_id: @permission.permissible_user_id, user_id: @permission.user_id }
    assert_redirected_to permission_path(assigns(:permission))
  end

  test "should destroy permission" do
    assert_difference('Permission.count', -1) do
      delete :destroy, id: @permission
    end

    assert_redirected_to permissions_path
  end
end
