require "test_helper"

class DocumentDgForwardMinistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_dg_forward_minister = document_dg_forward_ministers(:one)
  end

  test "should get index" do
    get document_dg_forward_ministers_url
    assert_response :success
  end

  test "should get new" do
    get new_document_dg_forward_minister_url
    assert_response :success
  end

  test "should create document_dg_forward_minister" do
    assert_difference("DocumentDgForwardMinister.count") do
      post document_dg_forward_ministers_url, params: { document_dg_forward_minister: { description: @document_dg_forward_minister.description, directorate_id: @document_dg_forward_minister.directorate_id, document_from_dg_id: @document_dg_forward_minister.document_from_dg_id } }
    end

    assert_redirected_to document_dg_forward_minister_url(DocumentDgForwardMinister.last)
  end

  test "should show document_dg_forward_minister" do
    get document_dg_forward_minister_url(@document_dg_forward_minister)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_dg_forward_minister_url(@document_dg_forward_minister)
    assert_response :success
  end

  test "should update document_dg_forward_minister" do
    patch document_dg_forward_minister_url(@document_dg_forward_minister), params: { document_dg_forward_minister: { description: @document_dg_forward_minister.description, directorate_id: @document_dg_forward_minister.directorate_id, document_from_dg_id: @document_dg_forward_minister.document_from_dg_id } }
    assert_redirected_to document_dg_forward_minister_url(@document_dg_forward_minister)
  end

  test "should destroy document_dg_forward_minister" do
    assert_difference("DocumentDgForwardMinister.count", -1) do
      delete document_dg_forward_minister_url(@document_dg_forward_minister)
    end

    assert_redirected_to document_dg_forward_ministers_url
  end
end
