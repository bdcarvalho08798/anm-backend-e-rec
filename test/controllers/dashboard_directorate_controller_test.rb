require "test_helper"

class DashboardDirectorateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_directorate_index_url
    assert_response :success
  end

  test "should get show" do
    get dashboard_directorate_show_url
    assert_response :success
  end
end
