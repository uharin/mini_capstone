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
      user_id: current_user[:id], 
      subtotal: 
      tax: 
      total: 
    })
    if order.save
      render json: order.as_json
    else
      render json: {error: order.errors.full_messages}
    end
  end
end
