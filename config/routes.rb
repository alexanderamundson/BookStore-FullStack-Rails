Rails.application.routes.draw do
  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
  resources :orders
  mount ActionCable.server => '/cable'
  root 'store#index', as: 'store_index'
  get 'search', to: 'store#search'
  resources :carts
  resources :products
  resources :buyers, only: [:edit, :update]
  resources :sellers, only: [:edit, :update]

  get 'carts/:id', to: 'carts#show', as: 'myCart' 
  
  resources :line_items do
    member do
      patch "decrement"
    end
  end
  
  resources :sellers do
    resources :products                                         # a nested route: seller_products_path

    member do
        get 'orders', to: 'line_items#show_orders_for_seller'   # a nested route: orders_seller_path
    end
  end
  
  resources :buyers do
    resources :orders                       # a nested route: buyer_orders_path
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
