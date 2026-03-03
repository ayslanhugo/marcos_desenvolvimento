require "test_helper"

class ProgressesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get progresses_create_url
    assert_response :success
  end
end
