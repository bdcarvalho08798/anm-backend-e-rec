require "application_system_test_case"

class MinisterDocumentForwardNatdirectoratesTest < ApplicationSystemTestCase
  setup do
    @minister_document_forward_natdirectorate = minister_document_forward_natdirectorates(:one)
  end

  test "visiting the index" do
    visit minister_document_forward_natdirectorates_url
    assert_selector "h1", text: "Minister document forward natdirectorates"
  end

  test "should create minister document forward natdirectorate" do
    visit minister_document_forward_natdirectorates_url
    click_on "New minister document forward natdirectorate"

    fill_in "Description", with: @minister_document_forward_natdirectorate.description
    fill_in "Minister document", with: @minister_document_forward_natdirectorate.minister_document_id
    click_on "Create Minister document forward natdirectorate"

    assert_text "Minister document forward natdirectorate was successfully created"
    click_on "Back"
  end

  test "should update Minister document forward natdirectorate" do
    visit minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate)
    click_on "Edit this minister document forward natdirectorate", match: :first

    fill_in "Description", with: @minister_document_forward_natdirectorate.description
    fill_in "Minister document", with: @minister_document_forward_natdirectorate.minister_document_id
    click_on "Update Minister document forward natdirectorate"

    assert_text "Minister document forward natdirectorate was successfully updated"
    click_on "Back"
  end

  test "should destroy Minister document forward natdirectorate" do
    visit minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate)
    click_on "Destroy this minister document forward natdirectorate", match: :first

    assert_text "Minister document forward natdirectorate was successfully destroyed"
  end
end
