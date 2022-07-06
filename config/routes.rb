Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
    resources :posts
    # routes for admin
    get 'dashboard/' => 'dashboard#index'
  end
  resources :posts
  resources :users
  resources :groups
  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
