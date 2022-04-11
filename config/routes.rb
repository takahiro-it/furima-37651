Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  get 'items'     => 'items#index'
  resources :items do
    resources :comments, only: [:create, :destroy, :show, :index] 
  end
end