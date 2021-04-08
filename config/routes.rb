Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/about',                     to: 'static_pages#about'
  get    '/manager',                   to: 'static_pages#manager'
  get    '/signup',                    to: 'users#new'
  get    '/login',                     to: 'sessions#new'
  post   '/login',                     to: 'sessions#create'
  delete '/logout',                    to: 'sessions#destroy'
  get    '/clubs/taiikukai_kyugi',     to: 'clubs#taiikukai_kyugi'
  get    '/clubs/taiikukai_budo',      to: 'clubs#taiikukai_budo'
  get    '/clubs/taiikukai_rikujou',   to: 'clubs#taiikukai_rikujou'
  get    '/clubs/taiikukai_marine',    to: 'clubs#taiikukai_marine'
  get    '/clubs/taiikukai_sonota',    to: 'clubs#taiikukai_sonota'
  get    '/clubs/sports_kyugi',        to: 'clubs#sports_kyugi'
  get    '/clubs/sports_sonota',       to: 'clubs#sports_sonota'
  get    '/clubs/bunkakai_ongaku',     to: 'clubs#bunkakai_ongaku'
  get    '/clubs/bunkakai_geijutsu',   to: 'clubs#bunkakai_geijutsu'
  get    '/clubs/bunkakei_ongaku',     to: 'clubs#bunkakei_ongaku'
  get    '/clubs/bunkakei_geijutsu',   to: 'clubs#bunkakei_geijutsu'
  get    '/clubs/bunkakei_volunteer',  to: 'clubs#bunkakei_volunteer'
  get    '/clubs/bunkakei_kokusai',    to: 'clubs#bunkakei_kokusai'
  get    '/clubs/bunkakei_sonota',     to: 'clubs#bunkakei_sonota'
  get    '/clubs/iinkai',              to: 'clubs#iinkai'
  get    '/likes/:club_id/create',     to: 'likes#create'
  get    '/contacts/thanks',           to: 'contacts#thanks'
  get    '/credits/search',            to: 'credits#search'
  get    '/credits/easy',              to: 'credits#easy'
  get    '/credits/full',              to: 'credits#full'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :manuscripts
  resources :credits,             only: [:index, :new, :create, :destroy]
  resources :clubs,               only: [:index, :show, :new, :create, :edit, :update]
  resources :events
  resources :contacts,            only: [:index, :show, :new, :create]
end
