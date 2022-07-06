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

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  
  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
