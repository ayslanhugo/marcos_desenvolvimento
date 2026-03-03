class Milestone < ApplicationRecord
  # O dependent: :destroy garante que se apagarmos um marco, o progresso dele some junto (evita o 1º erro que você teve!)
  has_many :progresses, dependent: :destroy

  # Definindo os enums de tipo e categoria
  enum :tipo_desenvolvimento, { tipico: 0, sindrome_down: 1 }

  # Aqui está a mágica: ensinando ao Rails quais são as categorias válidas!
  enum :categoria, { motor: 0, cognitivo: 1, linguagem: 2, social: 3 }

  # Validações básicas
  validates :titulo, :descricao, :idade_minima_meses, :idade_maxima_meses, presence: true
end
