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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
