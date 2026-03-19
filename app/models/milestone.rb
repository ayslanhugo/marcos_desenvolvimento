class Milestone < ApplicationRecord
  has_many :progresses, dependent: :destroy

  enum :tipo_desenvolvimento, { tipico: 0, sindrome_down: 1 }

  enum :categoria, {
    motor: "motor",
    cognitivo: "cognitivo",
    linguagem: "linguagem",
    social: "social"
  }

  validates :titulo, :descricao, :idade_minima_meses, :idade_maxima_meses, presence: true
end
