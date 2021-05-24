Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :restaurants, only: [:new, :create] do
    resources :offers, only: [:index, :new, :create]
  end

  resources :offers, only: [:update, :edit] do
    resources :vouchers, only: [:new, :create]
  end

  resources :vouchers, only: [:show] do
    resources :redeems, only: [:create]
  end

end
