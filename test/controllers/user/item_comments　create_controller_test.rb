require "test_helper"

class User::ItemComments　createControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get user_item_comments　create_destroy_url
    assert_response :success
  end
end
