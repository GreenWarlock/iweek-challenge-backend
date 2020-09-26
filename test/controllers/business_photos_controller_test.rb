require 'test_helper'

class BusinessPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_photo = business_photos(:one)
  end

  test "should get index" do
    get business_photos_url, as: :json
    assert_response :success
  end

  test "should create business_photo" do
    assert_difference('BusinessPhoto.count') do
      post business_photos_url, params: { business_photo: { active: @business_photo.active, business_id: @business_photo.business_id, photo_url: @business_photo.photo_url } }, as: :json
    end

    assert_response 201
  end

  test "should show business_photo" do
    get business_photo_url(@business_photo), as: :json
    assert_response :success
  end

  test "should update business_photo" do
    patch business_photo_url(@business_photo), params: { business_photo: { active: @business_photo.active, business_id: @business_photo.business_id, photo_url: @business_photo.photo_url } }, as: :json
    assert_response 200
  end

  test "should destroy business_photo" do
    assert_difference('BusinessPhoto.count', -1) do
      delete business_photo_url(@business_photo), as: :json
    end

    assert_response 204
  end
end
