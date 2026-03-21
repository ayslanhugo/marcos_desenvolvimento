class Child < ApplicationRecord
  belongs_to :user
  has_many :progresses, dependent: :destroy

  enum :tipo_desenvolvimento, { tipico: 0, sindrome_down: 1 }

  validates :nome, :data_nascimento, :tipo_desenvolvimento, presence: true

  def idade_em_meses
    hoje = Date.today
    (hoje.year * 12 + hoje.month) - (data_nascimento.year * 12 + data_nascimento.month)
  end

  # NOVO MÉTODO: Transforma "14 meses" em "1 ano e 2 meses"
  def idade_formatada
    meses_totais = idade_em_meses
    return "0 meses" if meses_totais <= 0

    anos = meses_totais / 12
    meses = meses_totais % 12

    partes = []
    partes << "#{anos} #{anos == 1 ? 'ano' : 'anos'}" if anos > 0
    partes << "#{meses} #{meses == 1 ? 'mês' : 'meses'}" if meses > 0

    partes.join(" e ")
  end

  def milestones_count_for_type
    Milestone.where(tipo_desenvolvimento: self.tipo_desenvolvimento).count
  end

  def achieved_milestones_count
    progresses.joins(:milestone)
              .where(milestones: { tipo_desenvolvimento: self.tipo_desenvolvimento })
              .where(status: "adquirido")
              .count
  end
end
