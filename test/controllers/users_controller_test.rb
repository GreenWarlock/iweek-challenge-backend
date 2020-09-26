require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { active: @user.active, email: @user.email, exp: @user.exp, first_name: @user.first_name, last_name: @user.last_name, level: @user.level, middle_name: @user.middle_name, phone_number: @user.phone_number, photo: @user.photo, second_last_name: @user.second_last_name } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { active: @user.active, email: @user.email, exp: @user.exp, first_name: @user.first_name, last_name: @user.last_name, level: @user.level, middle_name: @user.middle_name, phone_number: @user.phone_number, photo: @user.photo, second_last_name: @user.second_last_name } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end
end
