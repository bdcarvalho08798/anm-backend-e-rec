require "test_helper"

class DashboardDepartmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_department_index_url
    assert_response :success
  end
end
