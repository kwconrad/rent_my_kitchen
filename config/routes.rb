Rails.application.routes.draw do

  resources :kitchens
  resources :listings, only: [:new, :index, :edit]

  #for all listings created by user - admin_listings
  namespace :admin do
    resources :listings, only: [:index]
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
