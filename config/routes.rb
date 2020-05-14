Rails.application.routes.draw do
  get '/works', to: 'works#index'
  get '/works/:id', to: 'works#show'


  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  # resources :works
  # resources :users
end
