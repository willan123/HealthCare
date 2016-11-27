require 'test_helper'

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get g" do
    get rails_g_url
    assert_response :success
  end

  test "should get controller" do
    get rails_controller_url
    assert_response :success
  end

  test "should get pages" do
    get rails_pages_url
    assert_response :success
  end

  test "should get index" do
    get rails_index_url
    assert_response :success
  end

end
