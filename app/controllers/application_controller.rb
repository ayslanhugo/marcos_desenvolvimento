class ApplicationController < ActionController::Base
  # Intercepta o erro de "Registro não encontrado" em qualquer parte do sistema
  rescue_from ActiveRecord::RecordNotFound, with: :registro_nao_encontrado

  private

  def registro_nao_encontrado
    flash[:alert] = "Acesso negado: O registro que você tentou acessar não existe ou não pertence a você."
    redirect_to children_path
  end
end
