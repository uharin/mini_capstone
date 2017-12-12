class Product < ApplicationRecord
# • Create a model method called `is_discounted` that returns true if an item is under $2 and false otherwise.
# • Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
# • Create a model method called total which will return the sum of the price + tax.
# • Overwrite the as_json method to return the model methods as part of the JSON output.

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
    in_stock: in_stock
    }
  end

  def is_discounted
    if price < 2
      return true
    else
      return false
    end
  end


  def tax
    tax = price * (0.09)
    p tax
  end

  def total
    total = price + tax
  end

end



































# Class Person

# name: string
# age: integer
# hair_color: string 
# eye_color: string



# alex = Person.new(name: "Alex", age: 30, hair_color: "brown", eye_color: "brown")











