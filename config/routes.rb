Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products

  resources :bookings, only: [:index, :update]
  get '/requests', to: 'workshops#requests', as: :requests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
