require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  # Incluímos os ajudantes do Devise para simular login
  include Devise::Test::IntegrationHelpers

  setup do
    # Antes de cada teste, carregamos o usuário do arquivo fixtures
    @user = users(:responsavel)
  end

  test "nao deve acessar a pagina inicial de criancas sem login" do
    # Tentamos entrar na página sem fazer login
    get children_url

    # O teste SÓ passa se o sistema nos chutar para a tela de login
    assert_redirected_to new_user_session_url
  end

  test "deve acessar a pagina de criancas se estiver logado" do
    # Simulamos o login
    sign_in @user

    # Tentamos entrar na página
    get children_url

    # O teste SÓ passa se a tela carregar com sucesso (Código 200)
    assert_response :success
  end
end
