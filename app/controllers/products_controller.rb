class ProductsController < ApplicationController
  def index
    all_products = Product.all
    render json: all_products.as_json
  end

  def show
    product_id = params[:id]
    product = Product.find_by(id:product_id)
    render json: product.as_json
  end

  def create
    new_product = Product.new({
    name: params[:name],
    price: params[:price],
    vendor: params[:vendor],
    description: params[:description]
  })
    new_product.save
  end

  def update
    product_id = params[:id]
    product_tbu = Product.find_by(id:product_id)
    product_tbu.name = params['name']
    product_tbu.price = params['price']
    product_tbu.vendor = params['vendor']
    product_tbu.description = params['description']
    product_tbu.save
    render json: product_tbu.as_json
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
  end
end


# not REST
  # def get_item
  #   user_choice = params[:name]
  #   user_item = Product.find_by("name" =>[user_choice])
  #   render json: {
  #     message: user_item
  #   }
  # end

  # def get_item2
  #   item_choice = params[:item_input]
  #   user_item = Product.find_by("name"=>[item_choice])
  #   render json: {
  #     item: user_item
  #   }
    #  item = ModelName.find_by(attribute_1: “some value”)