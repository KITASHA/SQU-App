Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :songs, only: [:new,:create,:destroy]
  resources :parts 
  resources :bands

  get '/homes/about', to: 'homes#about', as: 'about_home'
  get '/homes/show_1', to: 'homes#show_1', as: 'show_1_home'
  get '/homes/show_2', to: 'homes#show_2', as: 'show_2_home'
  get '/homes/show_3', to: 'homes#show_3', as: 'show_3_home'
  get '/homes/show_4', to: 'homes#show_4', as: 'show_4_home'
  delete '/reset_all', to: 'application#reset_all'
end
