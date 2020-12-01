Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :products do
    resources :bookings, except: [:show, :index] do
      collection do
        post :save_booking
      end
    end
    resources :favourites, only: [:create]
  end
  resources :bookings, only: [:show, :index] do
    resources :reviews, only: [:new, :create]
    resources :chatrooms, only: [:new, :create]
  end
  resources :favourites, only: [:index, :destroy]
  resources :products, only: [:show, :update, :destroy]
  resources :chatrooms, only: [:show] do
    resources :messages, only: :create
  end

  get '/myproducts', to: 'products#myproducts', as: :myproducts
  put '/myproducts', to: 'products#myproducts', as: :myproduct
  get '/booking/confirm', to: 'bookings#confirm', as: :confirm
  # post '/bookings/save_booking', to: 'bookings#save_booking', as: :save_booking
  get '/messages', to: 'pages#messages', as: :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
