require "test_helper"

class DocumentFromDnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_from_dn = document_from_dns(:one)
  end

  test "should get index" do
    get document_from_dns_url
    assert_response :success
  end

  test "should get new" do
    get new_document_from_dn_url
    assert_response :success
  end

  test "should create document_from_dn" do
    assert_difference("DocumentFromDn.count") do
      post document_from_dns_url, params: { document_from_dn: { attachment_doc_dn: @document_from_dn.attachment_doc_dn, category: @document_from_dn.category, directorate_id: @document_from_dn.directorate_id, forwardstatus: @document_from_dn.forwardstatus, natdirectorate_id: @document_from_dn.natdirectorate_id, priority: @document_from_dn.priority, reference_number: @document_from_dn.reference_number, sender: @document_from_dn.sender, status: @document_from_dn.status, subject: @document_from_dn.subject } }
    end

    assert_redirected_to document_from_dn_url(DocumentFromDn.last)
  end

  test "should show document_from_dn" do
    get document_from_dn_url(@document_from_dn)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_from_dn_url(@document_from_dn)
    assert_response :success
  end

  test "should update document_from_dn" do
    patch document_from_dn_url(@document_from_dn), params: { document_from_dn: { attachment_doc_dn: @document_from_dn.attachment_doc_dn, category: @document_from_dn.category, directorate_id: @document_from_dn.directorate_id, forwardstatus: @document_from_dn.forwardstatus, natdirectorate_id: @document_from_dn.natdirectorate_id, priority: @document_from_dn.priority, reference_number: @document_from_dn.reference_number, sender: @document_from_dn.sender, status: @document_from_dn.status, subject: @document_from_dn.subject } }
    assert_redirected_to document_from_dn_url(@document_from_dn)
  end

  test "should destroy document_from_dn" do
    assert_difference("DocumentFromDn.count", -1) do
      delete document_from_dn_url(@document_from_dn)
    end

    assert_redirected_to document_from_dns_url
  end
end
