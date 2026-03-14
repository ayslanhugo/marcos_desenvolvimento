require "test_helper"

class ChildTest < ActiveSupport::TestCase
  test "deve ser invalido sem nome" do
    # Tentamos criar uma criança sem nome
    crianca = Child.new(data_nascimento: Date.today, tipo_desenvolvimento: "tipico")

    # O teste SÓ passa se a criança for inválida (bloqueada pelo sistema)
    assert_not crianca.valid?
  end

  test "calcula a idade em meses corretamente" do
    # Pegamos a criança 'Athos' lá do nosso arquivo de fixtures (nascido há exatos 5 meses)
    crianca = children(:athos)

    # Afirmamos que a função idade_em_meses DEVE retornar 5
    assert_equal 5, crianca.idade_em_meses
  end
end
