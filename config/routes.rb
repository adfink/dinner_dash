Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :new, :create]
  resources :categories, only: [:index, :show]
  resources :items, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'

end
