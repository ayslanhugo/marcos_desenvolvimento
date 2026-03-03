class Child < ApplicationRecord
  # Relacionamentos
  belongs_to :user
  # Uma criança tem muitos registros de progresso. Se a criança for excluída, os progressos também serão.
  has_many :progresses, dependent: :destroy

  # Definindo os tipos de desenvolvimento (Enum)
  enum :tipo_desenvolvimento, { tipico: 0, sindrome_down: 1 }

  # Validações básicas
  validates :nome, :data_nascimento, :tipo_desenvolvimento, presence: true

  # Método para calcular a idade em meses
  # Ele precisa estar aqui dentro para que possamos fazer @child.idade_em_meses
  def idade_em_meses
    hoje = Date.today
    (hoje.year * 12 + hoje.month) - (data_nascimento.year * 12 + data_nascimento.month)
  end
end
