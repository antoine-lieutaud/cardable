Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :restaurants, only: [:new, :create, :show] do
    resources :offers, only: [:index, :new, :create]
  end

  
  resources :restaurants do
    resources :vouchers, only: [:new]
  end

  resources :vouchers, only: [:create, :show]
  
end
