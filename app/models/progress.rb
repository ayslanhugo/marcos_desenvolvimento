class Progress < ApplicationRecord
  belongs_to :child
  belongs_to :milestone

  # Status do marco para esta criança específica
  enum :status, { pendente: 0, alcancado: 1 }

  # Garante que não existam dois registros de progresso para a mesma criança e o mesmo marco
  validates :milestone_id, uniqueness: { scope: :child_id }
end
