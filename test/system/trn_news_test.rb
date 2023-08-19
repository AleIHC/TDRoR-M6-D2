require "application_system_test_case"

class TrnNewsTest < ApplicationSystemTestCase
  setup do
    @trn_new = trn_news(:one)
  end

  test "visiting the index" do
    visit trn_news_url
    assert_selector "h1", text: "Trn news"
  end

  test "should create trn new" do
    visit trn_news_url
    click_on "New trn new"

    fill_in "Description", with: @trn_new.description
    fill_in "Image", with: @trn_new.image
    fill_in "Title", with: @trn_new.title
    click_on "Create Trn new"

    assert_text "Trn new was successfully created"
    click_on "Back"
  end

  test "should update Trn new" do
    visit trn_new_url(@trn_new)
    click_on "Edit this trn new", match: :first

    fill_in "Description", with: @trn_new.description
    fill_in "Image", with: @trn_new.image
    fill_in "Title", with: @trn_new.title
    click_on "Update Trn new"

    assert_text "Trn new was successfully updated"
    click_on "Back"
  end

  test "should destroy Trn new" do
    visit trn_new_url(@trn_new)
    click_on "Destroy this trn new", match: :first

    assert_text "Trn new was successfully destroyed"
  end
end
