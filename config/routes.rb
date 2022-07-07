Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
    resources :posts
    # routes for admin
    get 'dashboard/' => 'dashboard#index'
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

  # devise_for :users, controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks',
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
end