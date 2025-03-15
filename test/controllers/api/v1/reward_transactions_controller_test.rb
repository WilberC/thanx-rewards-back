require "test_helper"

class Api::V1::RewardTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_reward_transactions_create_url
    assert_response :success
  end
end
