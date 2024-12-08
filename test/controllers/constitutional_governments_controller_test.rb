require "test_helper"

class ConstitutionalGovernmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @constitutional_government = constitutional_governments(:one)
  end

  test "should get index" do
    get constitutional_governments_url
    assert_response :success
  end

  test "should get new" do
    get new_constitutional_government_url
    assert_response :success
  end

  test "should create constitutional_government" do
    assert_difference("ConstitutionalGovernment.count") do
      post constitutional_governments_url, params: { constitutional_government: { constitutional_government_name: @constitutional_government.constitutional_government_name, sequential_number: @constitutional_government.sequential_number } }
    end

    assert_redirected_to constitutional_government_url(ConstitutionalGovernment.last)
  end

  test "should show constitutional_government" do
    get constitutional_government_url(@constitutional_government)
    assert_response :success
  end

  test "should get edit" do
    get edit_constitutional_government_url(@constitutional_government)
    assert_response :success
  end

  test "should update constitutional_government" do
    patch constitutional_government_url(@constitutional_government), params: { constitutional_government: { constitutional_government_name: @constitutional_government.constitutional_government_name, sequential_number: @constitutional_government.sequential_number } }
    assert_redirected_to constitutional_government_url(@constitutional_government)
  end

  test "should destroy constitutional_government" do
    assert_difference("ConstitutionalGovernment.count", -1) do
      delete constitutional_government_url(@constitutional_government)
    end

    assert_redirected_to constitutional_governments_url
  end
end
