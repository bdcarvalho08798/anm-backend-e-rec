require "test_helper"

class DashboardNatdirectorateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_natdirectorate_index_url
    assert_response :success
  end

  test "should get show" do
    get dashboard_natdirectorate_show_url
    assert_response :success
  end
end
