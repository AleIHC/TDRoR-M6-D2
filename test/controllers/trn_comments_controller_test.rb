require "test_helper"

class TrnCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trn_comment = trn_comments(:one)
  end

  test "should get index" do
    get trn_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_trn_comment_url
    assert_response :success
  end

  test "should create trn_comment" do
    assert_difference("TrnComment.count") do
      post trn_comments_url, params: { trn_comment: { content: @trn_comment.content, trn_new_id: @trn_comment.trn_new_id, trn_user_id: @trn_comment.trn_user_id } }
    end

    assert_redirected_to trn_comment_url(TrnComment.last)
  end

  test "should show trn_comment" do
    get trn_comment_url(@trn_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_trn_comment_url(@trn_comment)
    assert_response :success
  end

  test "should update trn_comment" do
    patch trn_comment_url(@trn_comment), params: { trn_comment: { content: @trn_comment.content, trn_new_id: @trn_comment.trn_new_id, trn_user_id: @trn_comment.trn_user_id } }
    assert_redirected_to trn_comment_url(@trn_comment)
  end

  test "should destroy trn_comment" do
    assert_difference("TrnComment.count", -1) do
      delete trn_comment_url(@trn_comment)
    end

    assert_redirected_to trn_comments_url
  end
end
