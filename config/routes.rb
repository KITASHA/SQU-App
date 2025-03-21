Rails.application.routes.draw do
  root to: 'homes#index'
  # 認証用のルーティング（不要な `GET` を削除）
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # 各種リソース
  resources :bands, param: :slug
  resources :events, only: [:index, :new, :create, :destroy]
  resources :topics, only: [:index, :new, :create, :destroy]
  resources :releases do
    member do
      patch :toggle_selected
    end
  end
  resources :gigs do
    collection do
      get :archive
    end
  end

  # 各種ページのルーティング
  get '/homes/about', to: 'homes#about', as: 'about_home'
  get '/homes/show_1', to: 'homes#show_1', as: 'show_1_home'
  get '/homes/show_2', to: 'homes#show_2', as: 'show_2_home'
  get '/homes/show_3', to: 'homes#show_3', as: 'show_3_home'
  get '/homes/option', to: 'homes#option', as: 'option_home'
  get '/homes/workshop', to: 'homes#workshop', as: 'workshop_home'
end
