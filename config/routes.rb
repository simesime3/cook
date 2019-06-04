Rails.application.routes.draw do
  get 'images/new'
  get 'storages/new'
  get 'sessions/new'
  get 'users/new'
  root 'pages#index'

  resources :users
  resources :storages
  resources :images


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
