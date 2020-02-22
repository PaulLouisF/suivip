Rails.application.routes.draw do
  get 'tickets/new'
  get 'tickets/index'
  get 'tickets/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => 'users', controllers: { confirmations: "confirmations" }

  get 'mypatients', to: 'dashboards#patients', as: :mypatients
  get 'mypatients/new', to: 'dashboards#new_patient'
  get 'mypatients/searchresult', to: 'dashboards#searchresult'
  get 'mytickets', to: 'dashboards#tickets', as: :mytickets
  get 'myaccount', to: 'dashboards#userinformation', as: :myaccount

  authenticated :user do
    root 'dashboards#patients', as: :authenticated_root
  end

  unauthenticated :user do
    root 'pages#home', as: :unauthenticated_root
  end

  get 'components', to: 'pages#components', as: :components

  resources :patients, only: [:index, :show, :new, :create, :edit, :update] do
    resources :consultations, only: [:index, :new, :create]
    resources :glucose_levels, only: [:index, :new, :create]
    resources :prescriptions, only: :index
    resources :tickets, only: [:new, :create]
  end
  
  resources :consultations, only: [:show] do
    resources :prescriptions, only: [:new, :create]
  end
end
