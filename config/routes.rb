Rails.application.routes.draw do
  root to: "pages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rentals
  resources :users, except: [:new]
  get 'signup', to: 'users#new' 
end
