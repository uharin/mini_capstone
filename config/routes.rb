Rails.application.routes.draw do
  
  post 'user_token' => 'user_token#create'
  # products routes

  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
  post '/products' =>  'products#create'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'

  # suppliers routes
  
  get '/suppliers' => 'suppliers#index'
  get '/suppliers/:id' => 'suppliers#show'
  post '/suppliers' =>  'suppliers#create'
  patch '/suppliers/:id' => 'suppliers#update'
  delete '/suppliers/:id' => 'suppliers#destroy'

  # users routes

  post '/users' => 'users#create'

  # order routes

  get '/orders' => 'orders#index'

  #carted_products routes

  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'
end
