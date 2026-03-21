require "test_helper"

class ChildTest < ActiveSupport::TestCase
  test "deve ser invalido sem nome" do
    crianca = Child.new(data_nascimento: Date.today, tipo_desenvolvimento: "tipico")

    assert_not crianca.valid?
  end

  test "calcula a idade em meses corretamente" do
    crianca = children(:athos)

    assert_equal 5, crianca.idade_em_meses
  end
end
