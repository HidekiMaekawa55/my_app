Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/profile', to: 'static_pages#profile'
  get  '/signup',  to: 'users#new'
  resources :users
end
