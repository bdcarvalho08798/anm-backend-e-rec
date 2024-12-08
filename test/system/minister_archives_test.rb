require "application_system_test_case"

class MinisterArchivesTest < ApplicationSystemTestCase
  setup do
    @minister_archive = minister_archives(:one)
  end

  test "visiting the index" do
    visit minister_archives_url
    assert_selector "h1", text: "Minister archives"
  end

  test "should create minister archive" do
    visit minister_archives_url
    click_on "New minister archive"

    fill_in "Author", with: @minister_archive.author
    fill_in "Constitutional government", with: @minister_archive.constitutional_government_id
    fill_in "Document number", with: @minister_archive.document_number
    fill_in "Document title", with: @minister_archive.document_title
    fill_in "Document type", with: @minister_archive.document_type
    fill_in "Reference number", with: @minister_archive.reference_number
    fill_in "Remarks", with: @minister_archive.remarks
    click_on "Create Minister archive"

    assert_text "Minister archive was successfully created"
    click_on "Back"
  end

  test "should update Minister archive" do
    visit minister_archive_url(@minister_archive)
    click_on "Edit this minister archive", match: :first

    fill_in "Author", with: @minister_archive.author
    fill_in "Constitutional government", with: @minister_archive.constitutional_government_id
    fill_in "Document number", with: @minister_archive.document_number
    fill_in "Document title", with: @minister_archive.document_title
    fill_in "Document type", with: @minister_archive.document_type
    fill_in "Reference number", with: @minister_archive.reference_number
    fill_in "Remarks", with: @minister_archive.remarks
    click_on "Update Minister archive"

    assert_text "Minister archive was successfully updated"
    click_on "Back"
  end

  test "should destroy Minister archive" do
    visit minister_archive_url(@minister_archive)
    click_on "Destroy this minister archive", match: :first

    assert_text "Minister archive was successfully destroyed"
  end
end
