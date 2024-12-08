require "test_helper"

class JobListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_list = job_lists(:one)
  end

  test "should get index" do
    get job_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_job_list_url
    assert_response :success
  end

  test "should create job_list" do
    assert_difference("JobList.count") do
      post job_lists_url, params: { job_list: { deadline: @job_list.deadline, description: @job_list.description, title: @job_list.title } }
    end

    assert_redirected_to job_list_url(JobList.last)
  end

  test "should show job_list" do
    get job_list_url(@job_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_list_url(@job_list)
    assert_response :success
  end

  test "should update job_list" do
    patch job_list_url(@job_list), params: { job_list: { deadline: @job_list.deadline, description: @job_list.description, title: @job_list.title } }
    assert_redirected_to job_list_url(@job_list)
  end

  test "should destroy job_list" do
    assert_difference("JobList.count", -1) do
      delete job_list_url(@job_list)
    end

    assert_redirected_to job_lists_url
  end
end
