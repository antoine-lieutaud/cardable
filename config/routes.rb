Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :components, to: "pages#components"
  resources :restaurants, only: [:new, :create, :show] do
    resources :offers, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      member do
        patch :archive
      end
    end
  end

  get "dashboard", to: "dashboards#show", as: :dashboard

  resources :restaurants do
    resources :vouchers, only: [:new]
  end

  resources :vouchers, only: [:create, :show]

  get "scan", to: "pages#scan"

end
