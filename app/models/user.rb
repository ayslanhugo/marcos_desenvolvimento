class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :children, dependent: :destroy

  before_destroy :impedir_exclusao_do_master

  private

  def impedir_exclusao_do_master
    if email == "admin@master.com"
      # Adiciona um erro e aborta a operação
      errors.add(:base, "A conta do administrador mestre não pode ser eliminada por segurança.")
      throw(:abort)
    end
  end
end
