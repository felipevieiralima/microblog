require "rails_helper"

RSpec.describe Devise::Mailer do


  it"enviar um email de confirmação para o meial correto com um texto" do
    usuario = FactoryGirl.create(:usuario)
    confirmation_email = Devise.mailer.deliveries.last

    expect(usuario.email).to eq confirmation_email.to[0]
    expect(confirmation_email.body.to_s).to have_content 'Bem vindo'
  end
end