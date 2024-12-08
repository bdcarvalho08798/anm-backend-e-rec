require "test_helper"

class MinisterDocumentForwardDirectoratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minister_document_forward_directorate = minister_document_forward_directorates(:one)
  end

  test "should get index" do
    get minister_document_forward_directorates_url
    assert_response :success
  end

  test "should get new" do
    get new_minister_document_forward_directorate_url
    assert_response :success
  end

  test "should create minister_document_forward_directorate" do
    assert_difference("MinisterDocumentForwardDirectorate.count") do
      post minister_document_forward_directorates_url, params: { minister_document_forward_directorate: { description: @minister_document_forward_directorate.description, minister_document_id: @minister_document_forward_directorate.minister_document_id } }
    end

    assert_redirected_to minister_document_forward_directorate_url(MinisterDocumentForwardDirectorate.last)
  end

  test "should show minister_document_forward_directorate" do
    get minister_document_forward_directorate_url(@minister_document_forward_directorate)
    assert_response :success
  end

  test "should get edit" do
    get edit_minister_document_forward_directorate_url(@minister_document_forward_directorate)
    assert_response :success
  end

  test "should update minister_document_forward_directorate" do
    patch minister_document_forward_directorate_url(@minister_document_forward_directorate), params: { minister_document_forward_directorate: { description: @minister_document_forward_directorate.description, minister_document_id: @minister_document_forward_directorate.minister_document_id } }
    assert_redirected_to minister_document_forward_directorate_url(@minister_document_forward_directorate)
  end

  test "should destroy minister_document_forward_directorate" do
    assert_difference("MinisterDocumentForwardDirectorate.count", -1) do
      delete minister_document_forward_directorate_url(@minister_document_forward_directorate)
    end

    assert_redirected_to minister_document_forward_directorates_url
  end
end
