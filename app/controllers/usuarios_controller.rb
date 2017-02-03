class UsuariosController < ApplicationController

  before_action :set_usuario, only: [:show, :seguindo, :seguidores]

  def index
    # Verifica se o usuário entrou com keywords
    if params[:keywords].present?
      @usuarios = Usuario.por_nome_ou_descricao(params[:keywords])
    else
      @usuarios = Usuario.all
    end

  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @tweets = @usuario.tweets
  end

  def seguindo
    @titulo = "Seguindo"
    @usuarios = @usuario.seguindo.paginate(:page => params[:page], :per_page => 10)
    render 'seguindo_seguidores'
  end

  def seguidores
    @titulo = "Seguidores"
    @usuarios = @usuario.seguidores.paginate(:page => params[:page], :per_page => 10)
    render 'seguindo_seguidores'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.where(id: params[:id]).first
  end

end
