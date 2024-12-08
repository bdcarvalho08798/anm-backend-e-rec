require "application_system_test_case"

class MinisterDocumentsTest < ApplicationSystemTestCase
  setup do
    @minister_document = minister_documents(:one)
  end

  test "visiting the index" do
    visit minister_documents_url
    assert_selector "h1", text: "Minister documents"
  end

  test "should create minister document" do
    visit minister_documents_url
    click_on "New minister document"

    fill_in "Attachment document", with: @minister_document.attachment_document
    fill_in "Category", with: @minister_document.category
    fill_in "Document source", with: @minister_document.document_source
    fill_in "Forward status", with: @minister_document.forward_status
    fill_in "Priority", with: @minister_document.priority
    fill_in "Reference number", with: @minister_document.reference_number
    fill_in "Sender", with: @minister_document.sender
    fill_in "Status", with: @minister_document.status
    fill_in "Subject", with: @minister_document.subject
    click_on "Create Minister document"

    assert_text "Minister document was successfully created"
    click_on "Back"
  end

  test "should update Minister document" do
    visit minister_document_url(@minister_document)
    click_on "Edit this minister document", match: :first

    fill_in "Attachment document", with: @minister_document.attachment_document
    fill_in "Category", with: @minister_document.category
    fill_in "Document source", with: @minister_document.document_source
    fill_in "Forward status", with: @minister_document.forward_status
    fill_in "Priority", with: @minister_document.priority
    fill_in "Reference number", with: @minister_document.reference_number
    fill_in "Sender", with: @minister_document.sender
    fill_in "Status", with: @minister_document.status
    fill_in "Subject", with: @minister_document.subject
    click_on "Update Minister document"

    assert_text "Minister document was successfully updated"
    click_on "Back"
  end

  test "should destroy Minister document" do
    visit minister_document_url(@minister_document)
    click_on "Destroy this minister document", match: :first

    assert_text "Minister document was successfully destroyed"
  end
end
