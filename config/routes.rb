Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      collection do
        get 'search'
      end
    # get 'users/' => 'users#index'
    # get 'users/new' => 'users#new'
    # post 'users/' => 'users#create'
    # get 'users/:id' => 'users#show', as: 'users_show'
    # get 'users/:id/edit' => 'users#edit', as: 'users_edit'
    # put 'users/:id' => 'users#update'
    # patch 'users/:id' => 'users#update'
    # delete '/users/:id' => 'users#destroy', as: 'users_delete'

    # routes for admin
    end
    resources :posts
    get 'dashboard/' => 'dashboard#index'
  end
  
  resources :posts
  root 'posts#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
