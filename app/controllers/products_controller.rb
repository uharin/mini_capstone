class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    the_search_term = params[:search_term]
    all_products = Product.order(:id).where("name LIKE ?", "%#{the_search_term}%")
    render json: all_products.as_json
  end

  def show
    product_id = params[:id]
    product = Product.find_by(id:product_id)
    render json: product.as_json
  end

  def create
    product = Product.new({
    name: params[:name],
    price: params[:price],
    supplier: params[:supplier],
    description: params[:description],
    in_stock: params[:in_stock]
  })
    if product.save
      render json: product.as_json
    else
      render json: {error: product.errors.full_messages}
    end
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id:product_id)
    product.name = params['name']
    product.price = params['price']
    product.supplier = params['supplier']
    product.description = params['description']
    if product.save
      render json: product.as_json
    else
      render json: {error: product.errors.full_messages}
    end
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id:product_id)
    product.destroy
  end
end