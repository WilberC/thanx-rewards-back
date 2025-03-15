require "test_helper"

class Api::V1::UserRewardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_user_rewards_show_url
    assert_response :success
  end
end
