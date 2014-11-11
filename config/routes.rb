Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: 'pages#index'
  resources :users, only: [:show, :create]
  resources :packs, only: [:show, :new, :create]
  resources :cards, only: [:new, :create, :show]
  get '/answer/:card_id', to: 'cards#answer', as: :answer
  get '/learned/:card_id', to: 'cards#learned', as: :learned
  get '/random_card', to: 'cards#random_card', as: :random_card

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
