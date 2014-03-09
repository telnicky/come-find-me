ComeFindMe::Application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :locations

  resources :location_requests

  resources :friendships

  resources :password_resets

  resources :sessions

  resources :users

  root 'users#index'
end
