class Admin::UsersController < Admin::ApplicationController
  def toggle_admin
    @user = User.find(params[:id])

    if @user == current_user
      redirect_to admin_root_path, alert: "Não podes remover o teu próprio acesso de administrador."
    else
      @user.update(admin: !@user.admin?)
      redirect_to admin_root_path, notice: "Permissões de #{@user.email} atualizadas com sucesso."
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user == current_user
      redirect_to admin_root_path, alert: "Não podes excluir a tua própria conta."
    else
      @user.destroy
      redirect_to admin_root_path, notice: "Utilizador excluído com sucesso do sistema."
    end
  end
end
