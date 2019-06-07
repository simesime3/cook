Rails.application.routes.draw do
  get 'titles/new'
  get 'images/new'
  get 'storages/new'
  get 'sessions/new'
  get 'users/new'
  root 'pages#index'

  resources :users
  resources :storages
  resources :images
  resources :titles

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
