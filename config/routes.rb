OlmaShop::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/olma', :as => 'rails_admin'
  mount JasmineRails::Engine => "/specs" unless Rails.env.production?

  root :to => "shop#index"
  resources :products
  resources :categories
  resource :cart
  
  match 'cart/add/:id' => "carts#add"
  match 'cart/del/:id' => "carts#del"
  match 'cart/confirm' => "carts#confirm"
  match 'discounts.json' => "products#discounts"
  match 'recently_added.json' => "products#recently_added"
end
