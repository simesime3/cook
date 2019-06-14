Rails.application.routes.draw do
  get 'my_pages/new'
  get 'my_images/new'
  get 'pages/new'
  get 'titles/new'
  get 'my_images/new'
  get 'my_pages/new'
  get 'sessions/new'
  get 'users/new'
  root 'pages#index'
  patch 'my_images', to: 'my_images#update'

  resources :users
  resources :my_pages
  resources :my_images
  resources :titles

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
