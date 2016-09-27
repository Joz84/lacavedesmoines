Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  get 'mentions', to: "pages#mentions", as: "mentions"
  get "dashboard" , to: "pages#dashboard", as: "dashboard"
  resources :products, only: [:index]
  get "product/:id/:sku/:alcohol/:brewery/:color/:capacity", to: "products#show", as: "product"
  resources :carts, only: [:create]
  patch "cart" , to: "carts#update"
  put "cart" , to: "carts#update"
  get "cart" , to: "carts#edit"
  resources :orders, only: [:new, :create, :update, :show] do
    resources :payments, only: [:new, :create, :show]
  end
  resources :breweries, only: [:index, :show]
  resources :deposits, only: [:show]
  resources :news, only: [:index, :show]
  mount Attachinary::Engine => "/attachinary"
end
