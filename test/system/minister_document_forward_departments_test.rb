require "application_system_test_case"

class MinisterDocumentForwardDepartmentsTest < ApplicationSystemTestCase
  setup do
    @minister_document_forward_department = minister_document_forward_departments(:one)
  end

  test "visiting the index" do
    visit minister_document_forward_departments_url
    assert_selector "h1", text: "Minister document forward departments"
  end

  test "should create minister document forward department" do
    visit minister_document_forward_departments_url
    click_on "New minister document forward department"

    fill_in "Description", with: @minister_document_forward_department.description
    fill_in "Minister document", with: @minister_document_forward_department.minister_document_id
    fill_in "Natdirectorate", with: @minister_document_forward_department.natdirectorate_id
    click_on "Create Minister document forward department"

    assert_text "Minister document forward department was successfully created"
    click_on "Back"
  end

  test "should update Minister document forward department" do
    visit minister_document_forward_department_url(@minister_document_forward_department)
    click_on "Edit this minister document forward department", match: :first

    fill_in "Description", with: @minister_document_forward_department.description
    fill_in "Minister document", with: @minister_document_forward_department.minister_document_id
    fill_in "Natdirectorate", with: @minister_document_forward_department.natdirectorate_id
    click_on "Update Minister document forward department"

    assert_text "Minister document forward department was successfully updated"
    click_on "Back"
  end

  test "should destroy Minister document forward department" do
    visit minister_document_forward_department_url(@minister_document_forward_department)
    click_on "Destroy this minister document forward department", match: :first

    assert_text "Minister document forward department was successfully destroyed"
  end
end
