require "test_helper"

class TrackingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get track_url
    assert_response :success
  end
end
