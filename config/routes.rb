Rails.application.routes.draw do
  
  get '/products' => 'products#product_info'
  get '/vendors' => 'vendors#vendors_info'
end
