Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index]
  get "product/:id/:sku/:alcohol/:brewery/:color/:specificity/:capacity", to: "products#show", as: "product"
  resources :carts, only: [:create, :show]
  resources :orders, only: [:edit, :create]
  resources :payments, only: [:new, :create, :show]
end
