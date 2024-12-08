require "application_system_test_case"

class MinisterDocumentForwardDepartmentUnitsTest < ApplicationSystemTestCase
  setup do
    @minister_document_forward_department_unit = minister_document_forward_department_units(:one)
  end

  test "visiting the index" do
    visit minister_document_forward_department_units_url
    assert_selector "h1", text: "Minister document forward department units"
  end

  test "should create minister document forward department unit" do
    visit minister_document_forward_department_units_url
    click_on "New minister document forward department unit"

    fill_in "Description", with: @minister_document_forward_department_unit.description
    fill_in "Directorate", with: @minister_document_forward_department_unit.directorate_id
    fill_in "Minister document", with: @minister_document_forward_department_unit.minister_document_id
    click_on "Create Minister document forward department unit"

    assert_text "Minister document forward department unit was successfully created"
    click_on "Back"
  end

  test "should update Minister document forward department unit" do
    visit minister_document_forward_department_unit_url(@minister_document_forward_department_unit)
    click_on "Edit this minister document forward department unit", match: :first

    fill_in "Description", with: @minister_document_forward_department_unit.description
    fill_in "Directorate", with: @minister_document_forward_department_unit.directorate_id
    fill_in "Minister document", with: @minister_document_forward_department_unit.minister_document_id
    click_on "Update Minister document forward department unit"

    assert_text "Minister document forward department unit was successfully updated"
    click_on "Back"
  end

  test "should destroy Minister document forward department unit" do
    visit minister_document_forward_department_unit_url(@minister_document_forward_department_unit)
    click_on "Destroy this minister document forward department unit", match: :first

    assert_text "Minister document forward department unit was successfully destroyed"
  end
end
