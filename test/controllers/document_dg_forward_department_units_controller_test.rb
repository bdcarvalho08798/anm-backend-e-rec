require "test_helper"

class DocumentDgForwardDepartmentUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_dg_forward_department_unit = document_dg_forward_department_units(:one)
  end

  test "should get index" do
    get document_dg_forward_department_units_url
    assert_response :success
  end

  test "should get new" do
    get new_document_dg_forward_department_unit_url
    assert_response :success
  end

  test "should create document_dg_forward_department_unit" do
    assert_difference("DocumentDgForwardDepartmentUnit.count") do
      post document_dg_forward_department_units_url, params: { document_dg_forward_department_unit: { description: @document_dg_forward_department_unit.description, document_from_dg_id: @document_dg_forward_department_unit.document_from_dg_id } }
    end

    assert_redirected_to document_dg_forward_department_unit_url(DocumentDgForwardDepartmentUnit.last)
  end

  test "should show document_dg_forward_department_unit" do
    get document_dg_forward_department_unit_url(@document_dg_forward_department_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_dg_forward_department_unit_url(@document_dg_forward_department_unit)
    assert_response :success
  end

  test "should update document_dg_forward_department_unit" do
    patch document_dg_forward_department_unit_url(@document_dg_forward_department_unit), params: { document_dg_forward_department_unit: { description: @document_dg_forward_department_unit.description, document_from_dg_id: @document_dg_forward_department_unit.document_from_dg_id } }
    assert_redirected_to document_dg_forward_department_unit_url(@document_dg_forward_department_unit)
  end

  test "should destroy document_dg_forward_department_unit" do
    assert_difference("DocumentDgForwardDepartmentUnit.count", -1) do
      delete document_dg_forward_department_unit_url(@document_dg_forward_department_unit)
    end

    assert_redirected_to document_dg_forward_department_units_url
  end
end
