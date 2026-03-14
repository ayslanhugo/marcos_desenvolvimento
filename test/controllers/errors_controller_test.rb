require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "deve retornar 404 para pagina nao encontrada" do
    get "/404"
    assert_response :not_found
  end

  test "deve retornar 500 para erro interno" do
    get "/500"
    assert_response :internal_server_error
  end
end
