require "application_system_test_case"

class MinisterDocumentForwardDirectoratesTest < ApplicationSystemTestCase
  setup do
    @minister_document_forward_directorate = minister_document_forward_directorates(:one)
  end

  test "visiting the index" do
    visit minister_document_forward_directorates_url
    assert_selector "h1", text: "Minister document forward directorates"
  end

  test "should create minister document forward directorate" do
    visit minister_document_forward_directorates_url
    click_on "New minister document forward directorate"

    fill_in "Description", with: @minister_document_forward_directorate.description
    fill_in "Minister document", with: @minister_document_forward_directorate.minister_document_id
    click_on "Create Minister document forward directorate"

    assert_text "Minister document forward directorate was successfully created"
    click_on "Back"
  end

  test "should update Minister document forward directorate" do
    visit minister_document_forward_directorate_url(@minister_document_forward_directorate)
    click_on "Edit this minister document forward directorate", match: :first

    fill_in "Description", with: @minister_document_forward_directorate.description
    fill_in "Minister document", with: @minister_document_forward_directorate.minister_document_id
    click_on "Update Minister document forward directorate"

    assert_text "Minister document forward directorate was successfully updated"
    click_on "Back"
  end

  test "should destroy Minister document forward directorate" do
    visit minister_document_forward_directorate_url(@minister_document_forward_directorate)
    click_on "Destroy this minister document forward directorate", match: :first

    assert_text "Minister document forward directorate was successfully destroyed"
  end
end
