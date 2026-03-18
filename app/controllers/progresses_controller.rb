class ProgressesController < ApplicationController
  before_action :set_child
  before_action :set_milestone, only: [ :create ]

  def create
    @progress = @child.progresses.find_or_initialize_by(milestone: @milestone)

    respond_to do |format|
      if @progress.update(progress_params)
        format.turbo_stream
        format.html { redirect_to child_path(@child), notice: "Progresso salvo!" }
      else
        format.html { redirect_to child_path(@child), alert: "Erro ao salvar." }
      end
    end
  end

  private

  def set_child
    @child = current_user.children.find(params[:child_id])
  end

  def set_milestone
    @milestone = Milestone.find(params[:milestone_id] || params[:progress][:milestone_id])
  end

  def progress_params
    params.require(:progress).permit(:status, :notes, :milestone_id)
  end
end
