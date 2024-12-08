require "application_system_test_case"

class JobListsTest < ApplicationSystemTestCase
  setup do
    @job_list = job_lists(:one)
  end

  test "visiting the index" do
    visit job_lists_url
    assert_selector "h1", text: "Job lists"
  end

  test "should create job list" do
    visit job_lists_url
    click_on "New job list"

    fill_in "Deadline", with: @job_list.deadline
    fill_in "Description", with: @job_list.description
    fill_in "Title", with: @job_list.title
    click_on "Create Job list"

    assert_text "Job list was successfully created"
    click_on "Back"
  end

  test "should update Job list" do
    visit job_list_url(@job_list)
    click_on "Edit this job list", match: :first

    fill_in "Deadline", with: @job_list.deadline
    fill_in "Description", with: @job_list.description
    fill_in "Title", with: @job_list.title
    click_on "Update Job list"

    assert_text "Job list was successfully updated"
    click_on "Back"
  end

  test "should destroy Job list" do
    visit job_list_url(@job_list)
    click_on "Destroy this job list", match: :first

    assert_text "Job list was successfully destroyed"
  end
end
