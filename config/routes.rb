Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :items, only: [:create, :destroy, :show, :index] 
  end
end