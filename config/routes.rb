Rails.application.routes.draw do
  resources :kitchens

  devise_for :users
  root to: 'pages#home'
  get 'search', to: "kitchens#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
