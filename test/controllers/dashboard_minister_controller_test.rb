require "test_helper"

class DashboardMinisterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_minister_index_url
    assert_response :success
  end
end
