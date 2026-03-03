class HomeController < ApplicationController
  def index
    # Se o pai/mãe já estiver logado, manda direto para a lista de filhos
    if user_signed_in?
      redirect_to children_path
    end
    # Caso contrário, ele verá a página inicial padrão
  end
end
