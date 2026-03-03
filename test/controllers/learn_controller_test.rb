require "test_helper"

class LearnControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get learn_index_url
    assert_response :success
  end
end
