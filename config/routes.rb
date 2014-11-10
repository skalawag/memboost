Rails.application.routes.draw do
  root to: 'ui#register'
  get 'ui(/:action)', controller: 'ui'

  resources :users, only: [:show]
  resources :packs, only: [:show]
  resources :cards, only: [:new, :create, :show]
  get '/answer/:card_id', to: 'cards#answer', as: :answer
  get '/learned/:card_id', to: 'cards#learned', as: :learned
  get '/random_card', to: 'cards#random_card', as: :random_card
end
