require "application_system_test_case"

class DocumentDgForwardDepartmentsTest < ApplicationSystemTestCase
  setup do
    @document_dg_forward_department = document_dg_forward_departments(:one)
  end

  test "visiting the index" do
    visit document_dg_forward_departments_url
    assert_selector "h1", text: "Document dg forward departments"
  end

  test "should create document dg forward department" do
    visit document_dg_forward_departments_url
    click_on "New document dg forward department"

    fill_in "Description", with: @document_dg_forward_department.description
    fill_in "Document from dg", with: @document_dg_forward_department.document_from_dg_id
    click_on "Create Document dg forward department"

    assert_text "Document dg forward department was successfully created"
    click_on "Back"
  end

  test "should update Document dg forward department" do
    visit document_dg_forward_department_url(@document_dg_forward_department)
    click_on "Edit this document dg forward department", match: :first

    fill_in "Description", with: @document_dg_forward_department.description
    fill_in "Document from dg", with: @document_dg_forward_department.document_from_dg_id
    click_on "Update Document dg forward department"

    assert_text "Document dg forward department was successfully updated"
    click_on "Back"
  end

  test "should destroy Document dg forward department" do
    visit document_dg_forward_department_url(@document_dg_forward_department)
    click_on "Destroy this document dg forward department", match: :first

    assert_text "Document dg forward department was successfully destroyed"
  end
end
