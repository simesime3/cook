Rails.application.routes.draw do
  get 'searches/new'
  root 'pages#index'
  get 'my_pages/new'
  get 'user_storages/new'

  # resourecesにまとめる
  get 'my_images/new'
  patch 'my_images', to: 'my_images#update'
  post 'my_images', to: 'my_images#create'
  #

  resources :users
  resources :user_storages
  resources :searches
  post '/recipes/new' => 'recipes#create',as: 'recipes' #更新失敗した時にparamsの情報を保持する
  resources :recipes

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
