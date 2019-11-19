Rails.application.routes.draw do

  resources :users, only: [:new, :create, :destroy]
  resources :lists
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'

  get 'authorized', to: 'sessions#page_requires_login'
  
  get 'logout', to: 'sessions#destroy', as: 'logout'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
end