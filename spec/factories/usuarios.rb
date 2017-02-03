FactoryGirl.define do

  factory :usuario do
    nome "Usuário Teste"
    descricao "novo usuário"
    sequence(:email) { |s| "exemplotest#{s}@gmail.com" }
    password "123456"
    
  end

end
