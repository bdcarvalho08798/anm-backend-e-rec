require "test_helper"

class MinisterDocumentForwardDepartmentUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minister_document_forward_department_unit = minister_document_forward_department_units(:one)
  end

  test "should get index" do
    get minister_document_forward_department_units_url
    assert_response :success
  end

  test "should get new" do
    get new_minister_document_forward_department_unit_url
    assert_response :success
  end

  test "should create minister_document_forward_department_unit" do
    assert_difference("MinisterDocumentForwardDepartmentUnit.count") do
      post minister_document_forward_department_units_url, params: { minister_document_forward_department_unit: { description: @minister_document_forward_department_unit.description, directorate_id: @minister_document_forward_department_unit.directorate_id, minister_document_id: @minister_document_forward_department_unit.minister_document_id } }
    end

    assert_redirected_to minister_document_forward_department_unit_url(MinisterDocumentForwardDepartmentUnit.last)
  end

  test "should show minister_document_forward_department_unit" do
    get minister_document_forward_department_unit_url(@minister_document_forward_department_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_minister_document_forward_department_unit_url(@minister_document_forward_department_unit)
    assert_response :success
  end

  test "should update minister_document_forward_department_unit" do
    patch minister_document_forward_department_unit_url(@minister_document_forward_department_unit), params: { minister_document_forward_department_unit: { description: @minister_document_forward_department_unit.description, directorate_id: @minister_document_forward_department_unit.directorate_id, minister_document_id: @minister_document_forward_department_unit.minister_document_id } }
    assert_redirected_to minister_document_forward_department_unit_url(@minister_document_forward_department_unit)
  end

  test "should destroy minister_document_forward_department_unit" do
    assert_difference("MinisterDocumentForwardDepartmentUnit.count", -1) do
      delete minister_document_forward_department_unit_url(@minister_document_forward_department_unit)
    end

    assert_redirected_to minister_document_forward_department_units_url
  end
end
