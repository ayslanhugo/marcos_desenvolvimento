class Progress < ApplicationRecord
  belongs_to :child
  belongs_to :milestone

  # A nossa Escala Clínica de Maturidade
  enum :status, {
    nao_avaliado: 0,
    em_aquisicao: 1,
    adquirido: 2,
    regressao: 3
  }, default: :em_aquisicao

  # Motor de Regras Clínicas: Avalia se este progresso levanta um Alerta (Red Flag)
  def red_flag?
    # Regra 1: Regressão é SEMPRE um sinal de alerta imediato.
    return true if regressao?

    # Regra 2: Atraso na aquisição.
    # Se a criança já ultrapassou a idade máxima para este marco e ainda não o adquiriu.
    if (em_aquisicao? || nao_avaliado?) && child.idade_em_meses > milestone.idade_maxima_meses
      return true
    end

    false
  end

  # Texto formatado para exibir na tela bonitinho
  def status_formatado
    case status
    when "nao_avaliado" then "Não Avaliado"
    when "em_aquisicao" then "Em Aquisição"
    when "adquirido" then "Adquirido"
    when "regressao" then "Atenção: Regressão"
    end
  end
end
