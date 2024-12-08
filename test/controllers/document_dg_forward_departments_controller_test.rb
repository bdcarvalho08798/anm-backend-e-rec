require "test_helper"

class DocumentDgForwardDepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_dg_forward_department = document_dg_forward_departments(:one)
  end

  test "should get index" do
    get document_dg_forward_departments_url
    assert_response :success
  end

  test "should get new" do
    get new_document_dg_forward_department_url
    assert_response :success
  end

  test "should create document_dg_forward_department" do
    assert_difference("DocumentDgForwardDepartment.count") do
      post document_dg_forward_departments_url, params: { document_dg_forward_department: { description: @document_dg_forward_department.description, document_from_dg_id: @document_dg_forward_department.document_from_dg_id } }
    end

    assert_redirected_to document_dg_forward_department_url(DocumentDgForwardDepartment.last)
  end

  test "should show document_dg_forward_department" do
    get document_dg_forward_department_url(@document_dg_forward_department)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_dg_forward_department_url(@document_dg_forward_department)
    assert_response :success
  end

  test "should update document_dg_forward_department" do
    patch document_dg_forward_department_url(@document_dg_forward_department), params: { document_dg_forward_department: { description: @document_dg_forward_department.description, document_from_dg_id: @document_dg_forward_department.document_from_dg_id } }
    assert_redirected_to document_dg_forward_department_url(@document_dg_forward_department)
  end

  test "should destroy document_dg_forward_department" do
    assert_difference("DocumentDgForwardDepartment.count", -1) do
      delete document_dg_forward_department_url(@document_dg_forward_department)
    end

    assert_redirected_to document_dg_forward_departments_url
  end
end
