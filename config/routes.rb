Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
    resources :groups
    resources :posts do
      resources :comments
    end
    # routes for admin
    get 'dashboard/' => 'dashboard#index'
    get 'users/index'
  end
  resources :posts
  resources :groups

  resources :users  do
    member do
      post :follow
      post :unfollow
    end
  end
  
  root 'posts#index'

  
end