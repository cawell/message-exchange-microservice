Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  root to: 'home#show'

  post 'sign_in', to: "sessions#create"

  resources :users
end