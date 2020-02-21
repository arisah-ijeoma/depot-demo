Rails.application.routes.draw do
  resources :line_items do
    member do
      delete :remove_one
    end
  end
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products
end
