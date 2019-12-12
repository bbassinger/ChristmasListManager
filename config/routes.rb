Rails.application.routes.draw do


  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/favorites', to: 'favorite_projects#index', as: 'favorites'
  get "favorite_project/index" => "favorite_projects#index"
  get "favorite_projects", to: "sessions#favorites", as: 'favorite_projects' 
  resources :users
  resources :favorite_projects, only: [:new, :create, :destroy]
  resources :lists do
  put :favorite_project, on: :member
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
end