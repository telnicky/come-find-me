ComeFindMe::Application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :locations

  resources :location_requests

  resources :friendships

  resources :password_resets

  resources :sessions

  resources :sync, :only => [ :index ]
  get "sync/from/:from_date", :to => "sync#index"

  resources :users, :except => :index do
    get :search, :on => :collection
  end

  root 'sessions#new'
end
