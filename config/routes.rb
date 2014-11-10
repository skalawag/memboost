Rails.application.routes.draw do
  root to: 'ui#register'
  get 'ui(/:action)', controller: 'ui'

  resources :users, only: [:index]
end
