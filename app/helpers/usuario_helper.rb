module UsuarioHelper

  def nome_com_email(usuario)
   usuario.nome + " - " + usuario.email
  end

end
