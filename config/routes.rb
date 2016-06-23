Rails.application.routes.draw do

  #homepage
  root 'home_page#index'

  get '/auth/twitter/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'

  resources :tweets, only: [:index, :new, :create]


end
