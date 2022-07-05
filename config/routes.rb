Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get 'dashboard/index'
    get 'users/index'
    # routes for admin
  end
  resources :posts
  resources :users
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
