require "test_helper"

class DashboardStaffControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_staff_index_url
    assert_response :success
  end
end
