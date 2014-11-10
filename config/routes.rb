Rails.application.routes.draw do
  root to: 'ui#register'
  get 'ui(/:action)', controller: 'ui'

  resources :users, only: [:show]
  resources :packs, only: [:show]
  resources :cards, only: [:new, :create]
end
