Rails.application.routes.draw do
  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    get 'users/index'
    resources :groups
    resources :posts do
      resources :comments
    end
    
    resources :users do
      collection do
        get 'search'
      end
    end 
    # routes for admin
    resources :posts
    get 'dashboard/' => 'dashboard#index'
  end
  
  resources :groups
 
  root 'pages#home'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end