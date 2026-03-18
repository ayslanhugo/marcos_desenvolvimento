require "csv"

class Admin::DashboardController < Admin::ApplicationController
  def index
    @total_users = User.count
    @total_children = Child.count
    @total_progresses = Progress.count

    @recent_users = User.order(created_at: :desc).limit(10)

    @children_by_type = Child.group(:tipo_desenvolvimento).count.transform_keys { |k| k.to_s.humanize }

    @users_growth = User.group("DATE(created_at)").count
  end

  # 3. Lógica para gerar e descarregar o Relatório CSV
  def exportar_csv
    @users = User.includes(:children).order(created_at: :desc)

    # O CSV.generate sem argumentos usa a VÍRGULA como separador padrão global
    csv_data = CSV.generate do |csv|
      csv << [ "ID", "E-mail", "Administrador", "Data de Registo", "Criancas Registadas" ]

      @users.each do |user|
        csv << [
          user.id,
          user.email,
          user.admin? ? "Sim" : "Nao",
          user.created_at.strftime("%d/%m/%Y"),
          user.children.count
        ]
      end
    end

    send_data csv_data,
              filename: "relatorio_plataforma_#{Date.today}.csv",
              type: "text/csv",
              disposition: "attachment"
  end
end
