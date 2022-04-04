Rails.application.routes.draw do
  get 'items/index'
  # get 'orders/index'
  root to: "items#index"
end

