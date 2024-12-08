require "application_system_test_case"

class ConstitutionalGovernmentsTest < ApplicationSystemTestCase
  setup do
    @constitutional_government = constitutional_governments(:one)
  end

  test "visiting the index" do
    visit constitutional_governments_url
    assert_selector "h1", text: "Constitutional governments"
  end

  test "should create constitutional government" do
    visit constitutional_governments_url
    click_on "New constitutional government"

    fill_in "Constitutional government name", with: @constitutional_government.constitutional_government_name
    fill_in "Sequential number", with: @constitutional_government.sequential_number
    click_on "Create Constitutional government"

    assert_text "Constitutional government was successfully created"
    click_on "Back"
  end

  test "should update Constitutional government" do
    visit constitutional_government_url(@constitutional_government)
    click_on "Edit this constitutional government", match: :first

    fill_in "Constitutional government name", with: @constitutional_government.constitutional_government_name
    fill_in "Sequential number", with: @constitutional_government.sequential_number
    click_on "Update Constitutional government"

    assert_text "Constitutional government was successfully updated"
    click_on "Back"
  end

  test "should destroy Constitutional government" do
    visit constitutional_government_url(@constitutional_government)
    click_on "Destroy this constitutional government", match: :first

    assert_text "Constitutional government was successfully destroyed"
  end
end
