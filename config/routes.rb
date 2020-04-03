Rails.application.routes.draw do
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  resources :orders do 
    resource :orderitems
  end
  
  devise_for :users do
    resources :orders
  end
  
  get '/checkout' => 'cart#createOrder'
  
  resources :items
  root 'items#index'
  
  get '/paid/:id', to: 'items#paid'
  
  get '/cart/clear', to: 'cart#clear'
  get '/cart/remove/:id', to: 'cart#remove'
  get '/cart/reduce/:id', to: 'cart#reduce'
  get '/cart/increase/:id', to: 'cart#increase'
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  
 
  get '/logout', to: 'user#logout'
  
  root :to => 'site#index'
  
resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'
   get '/search' => 'items#search'
end
