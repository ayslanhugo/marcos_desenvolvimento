class ProgressesController < ApplicationController
  before_action :authenticate_user!

  def create
    @child = current_user.children.find(params[:child_id])
    @milestone = Milestone.find(params[:milestone_id])

    # Busca um registro existente ou cria um novo (find_or_initialize)
    @progress = Progress.find_or_initialize_by(child: @child, milestone: @milestone)

    if @progress.new_record?
      @progress.status = :alcancado
      @progress.data_alcance = Date.today
      @progress.save
      notice_msg = "Marco '#{@milestone.titulo}' alcançado! Parabéns! 🎉"
    else
      @progress.destroy
      notice_msg = "Registro removido."
    end

    # Redireciona de volta para a página da criança
    redirect_to child_path(@child, mes: params[:mes]), notice: notice_msg
  end
end
