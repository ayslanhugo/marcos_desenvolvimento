module ChildrenHelper
  def alerta_acolhedor(milestone, child)
    # Se o marco já foi alcançado, não mostra nada
    return if child.progresses.exists?(milestone: milestone)

    # Calculamos a idade da criança em meses
    hoje = Date.today
    idade_meses = (hoje.year * 12 + hoje.month) - (child.data_nascimento.year * 12 + child.data_nascimento.month)

    # Se a idade atual for maior que a idade máxima do marco
    if idade_meses > milestone.idade_maxima_meses
      content_tag(:div, class: "mt-3 p-3 bg-blue-50 border-l-4 border-blue-400 text-blue-700 text-xs italic") do
        "Cada criança tem seu tempo. Se você notar que este marco está demorando, conversar com seu pediatra pode trazer orientações valiosas."
      end
    end
  end
end
