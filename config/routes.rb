Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :songs, only: [:new,:create,:destroy]
  resources :parts 
  resources :bands
  resources :abouts, only: :index
  get '/abouts/show_1', to: 'abouts#show_1', as: 'show_1_about'
  get '/abouts/show_2', to: 'abouts#show_2', as: 'show_2_about'
  get '/abouts/show_3', to: 'abouts#show_3', as: 'show_3_about'
  delete '/reset_all', to: 'application#reset_all'
end
