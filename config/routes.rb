Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root "items#index"
  resources :items do
    resources :comments, only: [:create, :destroy] 
  end
end