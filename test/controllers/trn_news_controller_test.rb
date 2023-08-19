require "test_helper"

class TrnNewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @trn_new = trn_news(:one)
  end

  test "should get index" do
    get trn_news_url
    assert_response :success
  end

  test "should get new" do
    sign_in trn_users(:one)
    get new_trn_new_url
    assert_response :success
  end

  test "should create trn_new" do
    sign_in trn_users(:one)
    assert_difference("TrnNew.count") do
      post trn_news_url, params: { trn_new: { description: @trn_new.description, image: @trn_new.image, title: @trn_new.title } }
    end

    assert_redirected_to trn_new_url(TrnNew.last)
  end

  test "should show trn_new" do
    get trn_new_url(@trn_new)
    assert_response :success
  end

  test "should get edit" do
    sign_in trn_users(:one)
    get edit_trn_new_url(@trn_new)
    assert_response :success
  end

  test "should update trn_new" do
    sign_in trn_users(:one)
    patch trn_new_url(@trn_new), params: { trn_new: { description: @trn_new.description, image: @trn_new.image, title: @trn_new.title } }
    assert_redirected_to trn_new_url(@trn_new)
  end

  test "should destroy trn_new" do
    sign_in trn_users(:one)
    assert_difference("TrnNew.count", -1) do
      delete trn_new_url(@trn_new)
    end

    assert_redirected_to trn_news_url
  end
end
