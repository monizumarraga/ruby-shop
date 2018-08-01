Rails.application.routes.draw do
  resources :discounts
  resources :articles
  resources :user_articles, only: [:create, :update, :destroy]
  
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  get 'cart', to:"users#cart"
  get 'shop', to:"users#shop"
  
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
