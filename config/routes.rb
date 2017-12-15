Rails.application.routes.draw do
  
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

end
