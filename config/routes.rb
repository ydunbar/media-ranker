Rails.application.routes.draw do
  get '/works', to: 'works#index'
  # resources :works
end
