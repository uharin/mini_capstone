class CartedProductsController < ApplicationController
    
  def index
    carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
    # carted_products = current_user.carted_products.where(status: "carted") 
    p carted_products
    render json: carted_products.as_json   
  end


  def create
    carted_product = CartedProduct.new({
    quantity: params[:quantity],
    product_id: params[:product_id],
    user_id: current_user[:id],
    status: "carted"
  })
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {error: carted_product.errors.full_messages}
    end
  end
end
