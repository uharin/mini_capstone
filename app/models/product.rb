class Product < ApplicationRecord

# price -> numericality has to be a number larger than zero
# name -> unique
# description -> minimum of 10 characters

# DB RELATIONSHIPS
# ------------------------------------------------------------------
  belongs_to :supplier
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products

# VALIDATIONS
# ------------------------------------------------------------------
  validates :price, numericality: true
  validates :price, presence: true
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :in_stock, presence: true
  validates :description, presence: true
  validates :description, length: {maximum: 200}
  validates :description, length: {minimum: 20}

# CLASS METHODS
# ------------------------------------------------------------------

# • Create a model method called `is_discounted` that returns true if an item is under $2 and false otherwise.
# • Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
# • Create a model method called total which will return the sum of the price + tax.
# • Overwrite the as_json method to return the model methods as part of the JSON output.

# 1. Change your app to show the supplier’s info with each product.
# 2. Change your app so there can be multiple images, instead of just one. If you have one, you should remove the image attribute on the Product model, and create an entirely new model to do this.
# 3. Change your frontend to show all images with each product.
# 4. Bonus: Make it so a user can create new images for a given product. (This will require a separate images controller)
# Commit and push your changes (A friendly reminder!)

  def as_json
    {
    id: id,
    name: name,
    price: price,
    vendor: vendor,
    description: description,
    discounted: is_discounted,
    tax: tax,
    total: total,
    in_stock: in_stock,
    supplier: supplier.as_json,
    categories: categories.as_json,
    images: images
    }
  end

  def is_discounted
    if price < 2
      return true
    else
      return false
    end
  end

  def subtotal
    subtotal = price
  end
  
  def tax
    tax = price * (0.09)
    p tax
  end

  def total
    total = subtotal + tax
  end

end
