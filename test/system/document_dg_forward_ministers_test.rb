require "application_system_test_case"

class DocumentDgForwardMinistersTest < ApplicationSystemTestCase
  setup do
    @document_dg_forward_minister = document_dg_forward_ministers(:one)
  end

  test "visiting the index" do
    visit document_dg_forward_ministers_url
    assert_selector "h1", text: "Document dg forward ministers"
  end

  test "should create document dg forward minister" do
    visit document_dg_forward_ministers_url
    click_on "New document dg forward minister"

    fill_in "Description", with: @document_dg_forward_minister.description
    fill_in "Directorate", with: @document_dg_forward_minister.directorate_id
    fill_in "Document from dg", with: @document_dg_forward_minister.document_from_dg_id
    click_on "Create Document dg forward minister"

    assert_text "Document dg forward minister was successfully created"
    click_on "Back"
  end

  test "should update Document dg forward minister" do
    visit document_dg_forward_minister_url(@document_dg_forward_minister)
    click_on "Edit this document dg forward minister", match: :first

    fill_in "Description", with: @document_dg_forward_minister.description
    fill_in "Directorate", with: @document_dg_forward_minister.directorate_id
    fill_in "Document from dg", with: @document_dg_forward_minister.document_from_dg_id
    click_on "Update Document dg forward minister"

    assert_text "Document dg forward minister was successfully updated"
    click_on "Back"
  end

  test "should destroy Document dg forward minister" do
    visit document_dg_forward_minister_url(@document_dg_forward_minister)
    click_on "Destroy this document dg forward minister", match: :first

    assert_text "Document dg forward minister was successfully destroyed"
  end
end
