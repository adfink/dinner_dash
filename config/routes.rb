Rails.application.routes.draw do
  root to: 'users#index'
  

  resources :users, only: [:index, :new, :create]
  resources :categories, only: [:index, :show]
  resources :orders, only: [:show, :new, :create]
  resources :items, only: [:show]
  # resources :carts, only: [:create, :update]
  
  post '/cart', to: 'cart_items#create'
  get '/cart', to: 'cart_items#index'
  put '/cart', to: 'cart_items#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'

  namespace :admin do
    resources :users, only: [:show]
    resources :categories, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :edit]
    resources :items, only: [:index, :show, :edit, :new, :create, :update]
    resources :category_items, only: [:new, :create]
    get '/category_items/new_category_to_item/:item_id', to: 'category_items#new_category_to_item', :as => 'new_category_to_item'
  end

  get '*unmatched_route', to: 'application#not_found'
end
