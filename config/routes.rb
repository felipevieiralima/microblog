Rails.application.routes.draw do

  devise_for :usuarios

  resources :tweets

  resources :usuarios, only: [:show,:index] do
    member do
      get :seguindo
      get :seguidores
    end
  end

  resources :relacionamentos, only: [:create, :destroy] do
    resource :gerenciar_relacionamentos, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
