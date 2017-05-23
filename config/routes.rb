
Rails.application.routes.draw do

  resources :kitchens do
    resources :listings, only: [:new, :create, :index, :edit]
    resources :bookings
  end

  #for all listings created by user - admin_listings
  namespace :owner do
    resources :kitchens do
      resources :listings, only: [:index]
    end
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
