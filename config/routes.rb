Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
