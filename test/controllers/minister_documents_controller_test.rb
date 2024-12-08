require "test_helper"

class MinisterDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minister_document = minister_documents(:one)
  end

  test "should get index" do
    get minister_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_minister_document_url
    assert_response :success
  end

  test "should create minister_document" do
    assert_difference("MinisterDocument.count") do
      post minister_documents_url, params: { minister_document: { attachment_document: @minister_document.attachment_document, category: @minister_document.category, document_source: @minister_document.document_source, forward_status: @minister_document.forward_status, priority: @minister_document.priority, reference_number: @minister_document.reference_number, sender: @minister_document.sender, status: @minister_document.status, subject: @minister_document.subject } }
    end

    assert_redirected_to minister_document_url(MinisterDocument.last)
  end

  test "should show minister_document" do
    get minister_document_url(@minister_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_minister_document_url(@minister_document)
    assert_response :success
  end

  test "should update minister_document" do
    patch minister_document_url(@minister_document), params: { minister_document: { attachment_document: @minister_document.attachment_document, category: @minister_document.category, document_source: @minister_document.document_source, forward_status: @minister_document.forward_status, priority: @minister_document.priority, reference_number: @minister_document.reference_number, sender: @minister_document.sender, status: @minister_document.status, subject: @minister_document.subject } }
    assert_redirected_to minister_document_url(@minister_document)
  end

  test "should destroy minister_document" do
    assert_difference("MinisterDocument.count", -1) do
      delete minister_document_url(@minister_document)
    end

    assert_redirected_to minister_documents_url
  end
end
