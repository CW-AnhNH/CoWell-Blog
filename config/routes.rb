Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users do
      collection do
        get 'search'
      end
      
    # routes for admin
    end
    resources :posts
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
