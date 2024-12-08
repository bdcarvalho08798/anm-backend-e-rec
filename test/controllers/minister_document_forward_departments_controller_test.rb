require "test_helper"

class MinisterDocumentForwardDepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minister_document_forward_department = minister_document_forward_departments(:one)
  end

  test "should get index" do
    get minister_document_forward_departments_url
    assert_response :success
  end

  test "should get new" do
    get new_minister_document_forward_department_url
    assert_response :success
  end

  test "should create minister_document_forward_department" do
    assert_difference("MinisterDocumentForwardDepartment.count") do
      post minister_document_forward_departments_url, params: { minister_document_forward_department: { description: @minister_document_forward_department.description, minister_document_id: @minister_document_forward_department.minister_document_id, natdirectorate_id: @minister_document_forward_department.natdirectorate_id } }
    end

    assert_redirected_to minister_document_forward_department_url(MinisterDocumentForwardDepartment.last)
  end

  test "should show minister_document_forward_department" do
    get minister_document_forward_department_url(@minister_document_forward_department)
    assert_response :success
  end

  test "should get edit" do
    get edit_minister_document_forward_department_url(@minister_document_forward_department)
    assert_response :success
  end

  test "should update minister_document_forward_department" do
    patch minister_document_forward_department_url(@minister_document_forward_department), params: { minister_document_forward_department: { description: @minister_document_forward_department.description, minister_document_id: @minister_document_forward_department.minister_document_id, natdirectorate_id: @minister_document_forward_department.natdirectorate_id } }
    assert_redirected_to minister_document_forward_department_url(@minister_document_forward_department)
  end

  test "should destroy minister_document_forward_department" do
    assert_difference("MinisterDocumentForwardDepartment.count", -1) do
      delete minister_document_forward_department_url(@minister_document_forward_department)
    end

    assert_redirected_to minister_document_forward_departments_url
  end
end
