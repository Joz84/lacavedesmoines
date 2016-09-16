Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index]
  get "product/:id/:sku/:alcohol/:brewery/:color/:specificity/:capacity", to: "products#show", as: "product"
  resources :carts, only: [:create]
  patch "cart" , to: "carts#update"
  put "cart" , to: "carts#update"
  get "cart" , to: "carts#edit"
  resources :orders, only: [:new, :create, :update, :show] do
    resources :payments, only: [:new, :create, :show]
  end
end
