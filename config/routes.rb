Rails.application.routes.draw do
  root to: 'users#index'
  

  resources :users, only: [:index, :new, :create]
  resources :categories, only: [:index, :show]
  resources :orders, only: [:show, :new]
  resources :items, only: [:show, :index]
  # resources :carts, only: [:create, :update]
  
  post '/cart', to: 'cart_items#create'
  get '/cart', to: 'cart_items#index'
  put '/cart', to: 'cart_items#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'

  get '/search', to: 'search#items'

  namespace :admin do
    resources :users, only: [:show]
    resources :categories, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :edit]
    resources :items, only: [:index, :show, :edit, :new, :create, :update]
  end

  get '*unmatched_route', to: 'application#not_found'
end
