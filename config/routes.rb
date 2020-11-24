Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :bookings, except: [:show, :index]
    resources :favourites, only: [:create]
  end
  resources :bookings, only: [:show, :index]
  resources :favourites, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
