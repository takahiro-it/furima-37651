Rails.application.routes.draw do
  devise_for :users
  root to: "items#index" 
  # resources :products do
  #  resources :purchases, only: [:index, :create]
  # end
 end