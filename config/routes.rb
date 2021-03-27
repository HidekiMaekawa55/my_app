Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/about',    to: 'static_pages#about'
  get    '/manager',  to: 'static_pages#manager'
  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get    '/clubs/taiikukai_kyugi', to: 'clubs#taiikukai_kyugi'
  get    '/clubs/taiikukai_budo',  to: 'clubs#taiikukai_budo'
  get    '/likes/:club_id/create', to: 'likes#create'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :manuscripts
  resources :credits,             only: [:index, :new, :create, :destroy]
  resources :clubs,               onlu: [:index, :show]
end
