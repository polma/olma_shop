OlmaShop::Application.routes.draw do
  root :to => "shop#index"
  resources :products
  resources :categories
  resource :cart
  
  match 'cart/add/:id' => "carts#add"
  match 'cart/del/:id' => "carts#del"
  match 'cart/confirm' => "carts#confirm"
end
