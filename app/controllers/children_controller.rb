class ChildrenController < ApplicationController
  before_action :authenticate_user!
  before_action :set_child, only: [ :show, :edit, :update, :destroy, :report ]

  def index
    @children = current_user.children
  end

  def show
    @todas_milestones = Milestone.where(tipo_desenvolvimento: @child.tipo_desenvolvimento).order(:idade_minima_meses)

    @total_milestones = @todas_milestones.count
    @achieved_milestones = @child.progresses.where(milestone: @todas_milestones).count
    @percentage = @total_milestones > 0 ? ((@achieved_milestones.to_f / @total_milestones) * 100).round : 0

    @conquistas = {}
    @stats_data = {}

    Milestone.defined_enums["categoria"].keys.each do |categoria|
      total_na_categoria = @todas_milestones.where(categoria: categoria).count
      next if total_na_categoria == 0

      alcancados = @child.progresses.joins(:milestone).where(milestones: { categoria: categoria }).count
      @conquistas[categoria] = (total_na_categoria == alcancados)

      porcentagem = ((alcancados.to_f / total_na_categoria) * 100).round(0)
      @stats_data[categoria.humanize] = porcentagem
    end

    @meses_disponiveis = @todas_milestones.pluck(:idade_maxima_meses).uniq.sort

    if params[:mes].present?
      @mes_selecionado = params[:mes].to_i
      @milestones_exibidas = @todas_milestones.where("idade_minima_meses <= ? AND idade_maxima_meses >= ?", @mes_selecionado, @mes_selecionado)
    else
      @mes_selecionado = nil
      @milestones_exibidas = @todas_milestones
    end
  end

  def report
    @milestones = Milestone.where(tipo_desenvolvimento: @child.tipo_desenvolvimento).order(:idade_minima_meses)
    @progresses = @child.progresses.includes(:milestone)

    render layout: "print"
  end

  def new
    @child = current_user.children.build
  end

  def create
    @child = current_user.children.build(child_params)
    if @child.save
      redirect_to children_path, notice: "Perfil criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @child.update(child_params)
      redirect_to children_path, notice: "Dados atualizados com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path, notice: "Perfil removido.", status: :see_other
  end

  private

  def set_child
    @child = current_user.children.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:nome, :data_nascimento, :tipo_desenvolvimento)
  end
end
