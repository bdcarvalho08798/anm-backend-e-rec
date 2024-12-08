require "test_helper"

class DashboardOperatorMinisterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_operator_minister_index_url
    assert_response :success
  end
end
