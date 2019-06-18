Rails.application.routes.draw do
  get 'recipes/new'
  get 'my_pages/new'
  get 'pages/new'
  get 'recipes/new'
  get 'my_images/new'
  get 'user_storages/new'
  get 'sessions/new'
  get 'users/new'
  root 'pages#index'
  patch 'my_images', to: 'my_images#update'
  post 'my_images', to: 'my_images#create'

  resources :users
  resources :user_storages
  resources :recipes

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
