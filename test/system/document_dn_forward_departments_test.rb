require "application_system_test_case"

class DocumentDnForwardDepartmentsTest < ApplicationSystemTestCase
  setup do
    @document_dn_forward_department = document_dn_forward_departments(:one)
  end

  test "visiting the index" do
    visit document_dn_forward_departments_url
    assert_selector "h1", text: "Document dn forward departments"
  end

  test "should create document dn forward department" do
    visit document_dn_forward_departments_url
    click_on "New document dn forward department"

    fill_in "Description", with: @document_dn_forward_department.description
    click_on "Create Document dn forward department"

    assert_text "Document dn forward department was successfully created"
    click_on "Back"
  end

  test "should update Document dn forward department" do
    visit document_dn_forward_department_url(@document_dn_forward_department)
    click_on "Edit this document dn forward department", match: :first

    fill_in "Description", with: @document_dn_forward_department.description
    click_on "Update Document dn forward department"

    assert_text "Document dn forward department was successfully updated"
    click_on "Back"
  end

  test "should destroy Document dn forward department" do
    visit document_dn_forward_department_url(@document_dn_forward_department)
    click_on "Destroy this document dn forward department", match: :first

    assert_text "Document dn forward department was successfully destroyed"
  end
end
