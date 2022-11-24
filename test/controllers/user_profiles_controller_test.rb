require "test_helper"

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_profiles_show_url
    assert_response :success
  end
end
