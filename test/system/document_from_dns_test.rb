require "application_system_test_case"

class DocumentFromDnsTest < ApplicationSystemTestCase
  setup do
    @document_from_dn = document_from_dns(:one)
  end

  test "visiting the index" do
    visit document_from_dns_url
    assert_selector "h1", text: "Document from dns"
  end

  test "should create document from dn" do
    visit document_from_dns_url
    click_on "New document from dn"

    fill_in "Attachment doc dn", with: @document_from_dn.attachment_doc_dn
    fill_in "Category", with: @document_from_dn.category
    fill_in "Directorate", with: @document_from_dn.directorate_id
    fill_in "Forwardstatus", with: @document_from_dn.forwardstatus
    fill_in "Natdirectorate", with: @document_from_dn.natdirectorate_id
    fill_in "Priority", with: @document_from_dn.priority
    fill_in "Reference number", with: @document_from_dn.reference_number
    fill_in "Sender", with: @document_from_dn.sender
    fill_in "Status", with: @document_from_dn.status
    fill_in "Subject", with: @document_from_dn.subject
    click_on "Create Document from dn"

    assert_text "Document from dn was successfully created"
    click_on "Back"
  end

  test "should update Document from dn" do
    visit document_from_dn_url(@document_from_dn)
    click_on "Edit this document from dn", match: :first

    fill_in "Attachment doc dn", with: @document_from_dn.attachment_doc_dn
    fill_in "Category", with: @document_from_dn.category
    fill_in "Directorate", with: @document_from_dn.directorate_id
    fill_in "Forwardstatus", with: @document_from_dn.forwardstatus
    fill_in "Natdirectorate", with: @document_from_dn.natdirectorate_id
    fill_in "Priority", with: @document_from_dn.priority
    fill_in "Reference number", with: @document_from_dn.reference_number
    fill_in "Sender", with: @document_from_dn.sender
    fill_in "Status", with: @document_from_dn.status
    fill_in "Subject", with: @document_from_dn.subject
    click_on "Update Document from dn"

    assert_text "Document from dn was successfully updated"
    click_on "Back"
  end

  test "should destroy Document from dn" do
    visit document_from_dn_url(@document_from_dn)
    click_on "Destroy this document from dn", match: :first

    assert_text "Document from dn was successfully destroyed"
  end
end
