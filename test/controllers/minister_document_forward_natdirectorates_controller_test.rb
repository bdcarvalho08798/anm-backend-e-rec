require "test_helper"

class MinisterDocumentForwardNatdirectoratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minister_document_forward_natdirectorate = minister_document_forward_natdirectorates(:one)
  end

  test "should get index" do
    get minister_document_forward_natdirectorates_url
    assert_response :success
  end

  test "should get new" do
    get new_minister_document_forward_natdirectorate_url
    assert_response :success
  end

  test "should create minister_document_forward_natdirectorate" do
    assert_difference("MinisterDocumentForwardNatdirectorate.count") do
      post minister_document_forward_natdirectorates_url, params: { minister_document_forward_natdirectorate: { description: @minister_document_forward_natdirectorate.description, minister_document_id: @minister_document_forward_natdirectorate.minister_document_id } }
    end

    assert_redirected_to minister_document_forward_natdirectorate_url(MinisterDocumentForwardNatdirectorate.last)
  end

  test "should show minister_document_forward_natdirectorate" do
    get minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate)
    assert_response :success
  end

  test "should get edit" do
    get edit_minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate)
    assert_response :success
  end

  test "should update minister_document_forward_natdirectorate" do
    patch minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate), params: { minister_document_forward_natdirectorate: { description: @minister_document_forward_natdirectorate.description, minister_document_id: @minister_document_forward_natdirectorate.minister_document_id } }
    assert_redirected_to minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate)
  end

  test "should destroy minister_document_forward_natdirectorate" do
    assert_difference("MinisterDocumentForwardNatdirectorate.count", -1) do
      delete minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate)
    end

    assert_redirected_to minister_document_forward_natdirectorates_url
  end
end
