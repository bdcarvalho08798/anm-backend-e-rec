require "test_helper"

class MinisterArchivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minister_archive = minister_archives(:one)
  end

  test "should get index" do
    get minister_archives_url
    assert_response :success
  end

  test "should get new" do
    get new_minister_archive_url
    assert_response :success
  end

  test "should create minister_archive" do
    assert_difference("MinisterArchive.count") do
      post minister_archives_url, params: { minister_archive: { author: @minister_archive.author, constitutional_government_id: @minister_archive.constitutional_government_id, document_number: @minister_archive.document_number, document_title: @minister_archive.document_title, document_type: @minister_archive.document_type, reference_number: @minister_archive.reference_number, remarks: @minister_archive.remarks } }
    end

    assert_redirected_to minister_archive_url(MinisterArchive.last)
  end

  test "should show minister_archive" do
    get minister_archive_url(@minister_archive)
    assert_response :success
  end

  test "should get edit" do
    get edit_minister_archive_url(@minister_archive)
    assert_response :success
  end

  test "should update minister_archive" do
    patch minister_archive_url(@minister_archive), params: { minister_archive: { author: @minister_archive.author, constitutional_government_id: @minister_archive.constitutional_government_id, document_number: @minister_archive.document_number, document_title: @minister_archive.document_title, document_type: @minister_archive.document_type, reference_number: @minister_archive.reference_number, remarks: @minister_archive.remarks } }
    assert_redirected_to minister_archive_url(@minister_archive)
  end

  test "should destroy minister_archive" do
    assert_difference("MinisterArchive.count", -1) do
      delete minister_archive_url(@minister_archive)
    end

    assert_redirected_to minister_archives_url
  end
end
