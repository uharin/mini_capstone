class OrdersController < ApplicationController
  
  def index
    orders = Order.all
    if current_user 
      orders = current_user.order
      render json: orders.as_json
    else
      render json: {message: "You are not logged in"}
    end
  end

  def create
    order = Order.new({
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user[:id], 
      subtotal: Product.find_by(id: params[:product_id]).subtotal * params[:quantity].to_i,
      tax: Product.find_by(id: params[:product_id]).tax * params[:quantity].to_i,
      total: Product.find_by(id: params[:product_id]).total * params[:quantity].to_i
    })
    if order.save
      render json: order.as_json
    else
      render json: {error: order.errors.full_messages}
    end
  end
end
