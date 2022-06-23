Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
    get 'users/index'
    # routes for admin
  end
  resources :posts
  root 'posts#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
