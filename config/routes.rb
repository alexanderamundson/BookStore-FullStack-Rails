Rails.application.routes.draw do
  root 'store#index', as: 'store_index'
  get 'search', to: 'store#search'
  resources :carts
  resources :products

  get 'carts/:id', to: 'carts#show', as: 'myCart' 
  
  resources :line_items do
    member do
      patch "decrement", to: 'line_items#decrement', as: 'decrement'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
