Rails.application.routes.draw do
  get 'tickets/new'
  get 'tickets/index'
  get 'tickets/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => 'users', controllers: { confirmations: "confirmations" }

  get 'dashboard', to: 'dashboards#home', as: :dashboard
  get 'dashboard/mespatients', to: 'dashboards#patients', as: :mespatients
  get 'dashboard/mestickets', to: 'dashboards#tickets', as: :mestickets
  get 'dashboard/mesmedecins', to: 'dashboards#doctors', as: :mesmedecins
  get 'moncompte', to: 'dashboards#userinformation', as: :moncompte

  authenticated :user do
    root 'dashboards#patients', as: :authenticated_root
  end

  unauthenticated :user do
    root 'pages#home', as: :unauthenticated_root
  end

  get 'components', to: 'pages#components', as: :components

  resources :patients, only: [:index, :show, :new, :create, :edit, :update] do
    resources :consultations, only: [:index, :new, :create]
    resources :glucose_levels, only: :index
    resources :prescriptions, only: :index
  end

  resources :consultations, only: [:show] do
    resources :prescriptions, only: [:new, :create]
    resources :tickets, only: [:new, :create]
  end
end
