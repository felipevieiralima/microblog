class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_usuario!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :email, :descricao])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :email, :descricao,:foto, :password, :password_confirmation])
  end
end
