Rails.application.routes.draw do
  get 'groups/index'
  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    get 'users/index'
    get 'dashboard/groups', to: 'groups#index'
    get 'posts/index', to: 'dashboard#posts'
    
    # routes for admin
  end
 
  resources :groups, path: '/admin/groups'
  #get 'user/groups', to: 'groups#index_for_user'
  get 'user/groups/:id', to: 'groups#show', as: :user_show
  root 'pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
