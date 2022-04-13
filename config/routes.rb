Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # root to: 'orders#index'
  resources :items do
    resources :orders, only: [:index, :create, :new]
  end
end
