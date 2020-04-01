Rails.application.routes.draw do
  resources :orders
  resources :line_items do
    delete :remove_one, on: :member
  end
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products do
    get :who_bought, on: :member
  end

  match '*unmatched', to: 'application#route_not_found', via: :all
end
