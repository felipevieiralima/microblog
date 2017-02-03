class RelacionamentosController < ApplicationController

  before_action :set_relacionamento, only: [:show]

  def create
    usuario = Usuario.find(params[:seguidor_id])
    current_usuario.seguir(usuario)
    redirect_to usuario
  end

  def destroy
    usuario = Relacionamento.find(params[:id]).seguido
    current_usuario.deixar_de_seguir(usuario)
    redirect_to usuario
  end

  private

  def params_relacionamento

  end

  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @relacionamento = Relacionamento.where(id: params[:id]).first
  end

end
