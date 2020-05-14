Rails.application.routes.draw do
  get '/works', to: 'works#index'
  get '/users', to: 'users#index'
  # resources :works
  # resources :users
end
