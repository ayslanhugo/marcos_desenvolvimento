require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:responsavel)
  end

  test "nao deve acessar a pagina inicial de criancas sem login" do
    get children_url

    assert_redirected_to new_user_session_url
  end

  test "deve acessar a pagina de criancas se estiver logado" do
    sign_in @user

    get children_url

    assert_response :success
  end
end
