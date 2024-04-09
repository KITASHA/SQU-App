Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :songs, only: [:new,:create,:destroy]
  resources :parts 
  resources :bands, only: :create
  delete '/reset_all', to: 'application#reset_all'
end
