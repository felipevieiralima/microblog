class UsuarioMailer < ApplicationMailer

  def cadastro_criado(usuario)
    @usuario = usuario
    mail
  end

end