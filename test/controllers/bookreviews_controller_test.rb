require "test_helper"

class BookreviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookreviews_new_url
    assert_response :success
  end
end
