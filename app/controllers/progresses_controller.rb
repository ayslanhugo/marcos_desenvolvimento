class ProgressesController < ApplicationController
  before_action :set_child
  before_action :set_milestone, only: [ :create ]

  def create
    @progress = @child.progresses.find_or_initialize_by(milestone: @milestone)

    if @progress.update(progress_params)
      # Mantemos a inteligência clínica que você já tinha construído!
      if @progress.red_flag?
        flash[:alert] = "Atenção: Este marco sugere uma avaliação com o pediatra."
      else
        flash[:notice] = "Progresso salvo com sucesso!"
      end
    else
      # Se der erro, agora o Rails vai nos contar exatamente o porquê:
      flash[:alert] = "Não foi possível salvar o progresso: #{@progress.errors.full_messages.to_sentence}"
    end

    redirect_to child_path(@child)
  end

  private

  def set_child
    @child = current_user.children.find(params[:child_id])
  end

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id] || params[:progress][:milestone_id])
  end

  def progress_params
    # Adicionamos o :milestone_id aqui para garantir que o Rails não bloqueie o ID que vem do Modal
    params.require(:progress).permit(:status, :notes, :milestone_id)
  end
end
