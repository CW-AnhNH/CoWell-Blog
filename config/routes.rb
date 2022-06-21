Rails.application.routes.draw do
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
  
  root 'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
