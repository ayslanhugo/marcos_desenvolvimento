require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "deve carregar a pagina inicial" do
    get root_url
    assert_response :success
  end
end
