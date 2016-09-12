Rails.application.routes.draw do
  get 'orders/new'

  get 'orders/create'

  get 'carts/create'

  get 'carts/show'

  get 'products/index'

  get 'products/show'

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index]
  get "product/:permalink", to: "products#show", as: "product"
  resources :carts, only: [:create, :show]
  resources :orders, only: [:edit, :create]
  resources :payments, only: [:new, :create, :show]
end
