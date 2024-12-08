require "application_system_test_case"

class DocumentDgForwardDepartmentUnitsTest < ApplicationSystemTestCase
  setup do
    @document_dg_forward_department_unit = document_dg_forward_department_units(:one)
  end

  test "visiting the index" do
    visit document_dg_forward_department_units_url
    assert_selector "h1", text: "Document dg forward department units"
  end

  test "should create document dg forward department unit" do
    visit document_dg_forward_department_units_url
    click_on "New document dg forward department unit"

    fill_in "Description", with: @document_dg_forward_department_unit.description
    fill_in "Document from dg", with: @document_dg_forward_department_unit.document_from_dg_id
    click_on "Create Document dg forward department unit"

    assert_text "Document dg forward department unit was successfully created"
    click_on "Back"
  end

  test "should update Document dg forward department unit" do
    visit document_dg_forward_department_unit_url(@document_dg_forward_department_unit)
    click_on "Edit this document dg forward department unit", match: :first

    fill_in "Description", with: @document_dg_forward_department_unit.description
    fill_in "Document from dg", with: @document_dg_forward_department_unit.document_from_dg_id
    click_on "Update Document dg forward department unit"

    assert_text "Document dg forward department unit was successfully updated"
    click_on "Back"
  end

  test "should destroy Document dg forward department unit" do
    visit document_dg_forward_department_unit_url(@document_dg_forward_department_unit)
    click_on "Destroy this document dg forward department unit", match: :first

    assert_text "Document dg forward department unit was successfully destroyed"
  end
end
