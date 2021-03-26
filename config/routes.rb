Rails.application.routes.draw do
  get 'clubs/index'
  get 'clubs/show'
  root   'static_pages#home'
  get    '/about',    to: 'static_pages#about'
  get    '/manager',  to: 'static_pages#manager'
  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :manuscripts
  resources :credits,             only: [:index, :new, :create, :destroy]
end
