Rails.application.routes.draw do
  root to: 'ui#front'
  get 'ui(/:action)', controller: 'ui'
end
