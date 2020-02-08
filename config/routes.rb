Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => 'users', controllers: { confirmations: "confirmations" }

  get 'dashboard', to: 'dashboards#home', as: :dashboard
  get 'moncompte', to: 'dashboards#userinformation', as: :mesinfosperso

  authenticated :user do
    root 'dashboards#home', as: :authenticated_root
  end

  unauthenticated :user do
    root 'pages#home', as: :unauthenticated_root
  end

  get 'components', to: 'pages#components', as: :components

  resources :patients, only: [:index, :show, :new, :create, :edit, :update] do
    resources :consultations, only: [:index, :show, :new, :create, :edit, :update]
  end


end
