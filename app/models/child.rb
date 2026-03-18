class Child < ApplicationRecord
  belongs_to :user
  has_many :progresses, dependent: :destroy

  enum :tipo_desenvolvimento, { tipico: 0, sindrome_down: 1 }

  validates :nome, :data_nascimento, :tipo_desenvolvimento, presence: true

  def idade_em_meses
    hoje = Date.today
    (hoje.year * 12 + hoje.month) - (data_nascimento.year * 12 + data_nascimento.month)
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
