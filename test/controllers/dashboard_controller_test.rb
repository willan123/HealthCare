require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get schedule" do
    get dashboard_schedule_url
    assert_response :success
  end

  test "should get patients" do
    get dashboard_patients_url
    assert_response :success
  end

end
