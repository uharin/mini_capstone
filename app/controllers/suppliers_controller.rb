class SuppliersController < ApplicationController
  def index
    # the_search_term = params[:search_term]
    all_suppliers = Supplier.all
    # .order(:id).where("name LIKE ?", "%#{the_search_term}%")
    render json: all_suppliers.as_json
  end

  def show
    supplier_id = params[:id]
    supplier = Supplier.find_by(id:supplier_id)
    render json: supplier.as_json
  end

  def create
    supplier = Supplier.new({
    name: params[:name],
    email: params[:email],
    phone_number: params[:phone_number],
  })
    if supplier.save
      render json: supplier.as_json
    else
      render json: {error: supplier.errors.full_messages}
    end
  end

  def update
    supplier_id = params[:id]
    supplier = Supplier.find_by(id:supplier_id)
    supplier.name = params['name']
    supplier.price = params['price']
    supplier.vendor = params['vendor']
    supplier.description = params['description']
    if supplier.save
      render json: supplier.as_json
    else
      render json: {error: supplier.errors.full_messages}
    end
  end

  def destroy
    supplier_id = params[:id]
    supplier = supplier.find_by(id:supplier_id)
    supplier.destroy
  end

end