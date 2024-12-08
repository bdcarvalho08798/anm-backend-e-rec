require "test_helper"

class DocumentDnForwardDepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_dn_forward_department = document_dn_forward_departments(:one)
  end

  test "should get index" do
    get document_dn_forward_departments_url
    assert_response :success
  end

  test "should get new" do
    get new_document_dn_forward_department_url
    assert_response :success
  end

  test "should create document_dn_forward_department" do
    assert_difference("DocumentDnForwardDepartment.count") do
      post document_dn_forward_departments_url, params: { document_dn_forward_department: { description: @document_dn_forward_department.description } }
    end

    assert_redirected_to document_dn_forward_department_url(DocumentDnForwardDepartment.last)
  end

  test "should show document_dn_forward_department" do
    get document_dn_forward_department_url(@document_dn_forward_department)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_dn_forward_department_url(@document_dn_forward_department)
    assert_response :success
  end

  test "should update document_dn_forward_department" do
    patch document_dn_forward_department_url(@document_dn_forward_department), params: { document_dn_forward_department: { description: @document_dn_forward_department.description } }
    assert_redirected_to document_dn_forward_department_url(@document_dn_forward_department)
  end

  test "should destroy document_dn_forward_department" do
    assert_difference("DocumentDnForwardDepartment.count", -1) do
      delete document_dn_forward_department_url(@document_dn_forward_department)
    end

    assert_redirected_to document_dn_forward_departments_url
  end
end
