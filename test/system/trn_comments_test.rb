require "application_system_test_case"

class TrnCommentsTest < ApplicationSystemTestCase
  setup do
    @trn_comment = trn_comments(:one)
  end

  test "visiting the index" do
    visit trn_comments_url
    assert_selector "h1", text: "Trn comments"
  end

  test "should create trn comment" do
    visit trn_comments_url
    click_on "New trn comment"

    fill_in "Content", with: @trn_comment.content
    fill_in "Trn new", with: @trn_comment.trn_new_id
    fill_in "Trn user", with: @trn_comment.trn_user_id
    click_on "Create Trn comment"

    assert_text "Trn comment was successfully created"
    click_on "Back"
  end

  test "should update Trn comment" do
    visit trn_comment_url(@trn_comment)
    click_on "Edit this trn comment", match: :first

    fill_in "Content", with: @trn_comment.content
    fill_in "Trn new", with: @trn_comment.trn_new_id
    fill_in "Trn user", with: @trn_comment.trn_user_id
    click_on "Update Trn comment"

    assert_text "Trn comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Trn comment" do
    visit trn_comment_url(@trn_comment)
    click_on "Destroy this trn comment", match: :first

    assert_text "Trn comment was successfully destroyed"
  end
end
