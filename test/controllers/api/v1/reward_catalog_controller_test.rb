require "test_helper"

class Api::V1::RewardCatalogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_reward_catalog_index_url
    assert_response :success
  end
end
