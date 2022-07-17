Rails.application.routes.draw do
  namespace :api do
    # mount_devise_token_auth_for "User", at: "auth"

    mount_devise_token_auth_for "User", at: "auth", controllers: {
      registrations: "api/users/registrations",
      sessions: "api/users/sessions",
      confirmations: "api/users/confirmations"
    }
  end

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