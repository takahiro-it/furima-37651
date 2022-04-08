Rails.application.routes.draw do
  
  devise_for :orders
  devise_for :users
  get 'items/index'
  root to: "items#index" 
  resources :items do
   resources :users, only: [:index, :create]
  end
 end