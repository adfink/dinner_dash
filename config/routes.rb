Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :new, :create]
  resources :categories, only: [:index, :show]
  resources :items, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'

  namespace :admin do
    resources :users, only: [:show]
    resources :categories, only: [:new, :create, :index, :show, :edit]
    resources :orders, only: [:index, :show, :edit]
    resources :items, only: [:index, :show, :edit, :new, :create]
  end

end
