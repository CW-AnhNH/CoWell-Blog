Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
    get 'users/index'
    get 'groups'
    # routes for admin
  end
  root 'pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
