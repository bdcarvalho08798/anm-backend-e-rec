require "test_helper"

class HelpDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get help_dashboard_index_url
    assert_response :success
  end
end
