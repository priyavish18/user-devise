Rails.application.routes.draw do
  devise_for :users
  # devise_for :views
  #get 'home/index'
  root to: "menus#index"

  resources :menus do
  end

  #root to: "home#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :orders
  resources :order_items

  resources :shops
  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
