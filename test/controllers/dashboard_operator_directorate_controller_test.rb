require "test_helper"

class DashboardOperatorDirectorateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_operator_directorate_index_url
    assert_response :success
  end
end
