Rails.application.routes.draw do
  get 'pages/buy'
  get 'pages/home'
  get 'pages/about_us'
  get 'pages/prop_details'
  get 'pages/request_listing'
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rentals
  resources :users, except: [:new]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories
  
end
