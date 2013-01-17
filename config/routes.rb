OlmaShop::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/olma', :as => 'rails_admin'

  root :to => "shop#index"
  resources :products
  resources :categories
  resource :cart
  
  match 'cart/add/:id' => "carts#add"
  match 'cart/del/:id' => "carts#del"
  match 'cart/confirm' => "carts#confirm"
  match 'discounts.json' => "products#discounts"
end
