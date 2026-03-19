require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get online_order" do
    get dashboard_online_order_url
    assert_response :success
  end

  test "should get my_packages" do
    get dashboard_my_packages_url
    assert_response :success
  end

  test "should get warehouse" do
    get dashboard_warehouse_url
    assert_response :success
  end

  test "should get addresses" do
    get dashboard_addresses_url
    assert_response :success
  end

  test "should get profile" do
    get dashboard_profile_url
    assert_response :success
  end

  test "should get change_password" do
    get dashboard_change_password_url
    assert_response :success
  end
end
