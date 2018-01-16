require 'unirest'
require 'pp'

base_url = "http://localhost:3000"

while true 

  p "Choose an option"
  p "[1] see all products"
  p "[1.1] search products"
  p "[1.2] lookup products by category"
  p "[2] see a particular product"
  p "[3] add a product"
  p "[4] edit a product"
  p "[5] delete a product"
  p "[6] create a user"
  p "[7] add product to cart"
  p "[8] login"
  p "[9] logout"
  p "[10] show all orders"
  p "[11] show all carted products"
  p "[0] to exit"
  user_input = gets.chomp

  if user_input == "1"
    response = Unirest.get("#{base_url}/products")
    product_list = response.body
    pp product_list

  elsif user_input == "1.1"
    p "Please enter a product name"
    search_input = gets.chomp
    response = Unirest.get("#{base_url}/products", parameters: {search_term: search_input})
    product_list = response.body
    pp product_list

  elsif user_input == "1.2"
    p "Please enter the category ID for which you'd like to see view products"
    category_id_input = gets.chomp.to_i
    response = Unirest.get("#{base_url}/products", parameters: {category_id: category_id_input})
    pp response.body

  elsif user_input == "2"
    p "Enter the ID for the product you wish to view"
    product_id = gets.chomp.to_i
    response = Unirest.get("#{base_url}/products/#{product_id}")
    product = response.body
    pp product

  elsif user_input == "3"
    the_parameters = {}
    p "Please enter the product's name"
    the_parameters['name'] = gets.chomp
    p "Please enter the product's price"
    the_parameters['price'] = gets.chomp.to_i
    p "Please enter the product's supplier"
    the_parameters['supplier'] = gets.chomp
    p "Please enter the product's description"
    the_parameters['description'] = gets.chomp
    p "Is the product in stock?"
    the_parameters['in_stock'] = gets.chomp
    response = Unirest.post("#{base_url}/products", parameters: the_parameters)
    pp response.body

  elsif user_input == "4"
    p "Enter the ID for the item you would like to change"
    product_id = gets.chomp.to_i
    response = Unirest.get("#{base_url}/products/#{product_id}")
    pp product = response.body
    pp product
    the_parameters = {}
    p "Please enter the product's name"
    the_parameters['name'] = gets.chomp
    p "Please enter the product's price"
    the_parameters['price'] = gets.chomp.to_i
    p "Please enter the product's supplier"
    the_parameters['supplier'] = gets.chomp
    p "Please enter the product's description"
    the_parameters['description'] = gets.chomp
    response = Unirest.patch("#{base_url}/products/#{product_id}", parameters: the_parameters)
    pp response.body

  elsif user_input == "5"
    p "Please enter the ID for the product you wish to delete"
    product_id = gets.chomp.to_i
    response = Unirest.delete("#{base_url}/products/#{product_id}")
    p "You deleted a product with the ID of #{product_id}"

  elsif user_input == "6"
    the_parameters = {}
    p "Create an account"
    p "Please enter a username"
    the_parameters['name'] = gets.chomp
    p "Please enter an email address"
    the_parameters['email'] = gets.chomp
    p "Please enter your password"
    the_parameters['password'] = gets.chomp
    p "Please confirm your password"
    the_parameters['password_confirmation'] = gets.chomp
  # Leaving off here until Sunday...
    response = Unirest.post("#{base_url}/users", parameters: the_parameters)
    pp response.body

  elsif user_input == "7"
    the_parameters = {}
    p "Add items to cart"
    p "Please enter a product ID"
    the_parameters['product_id'] = gets.chomp
    p "Please enter a quantity"
    the_parameters['quantity'] = gets.chomp
    response = Unirest.post("#{base_url}/carted_products", parameters: the_parameters)
    pp response.body

  elsif user_input == "8"
    response = Unirest.post("#{base_url}/user_token",
    parameters: {
      auth: {
        email: "Bilbo@Baggins.com",
        password: "password"
      }
    }
    )
      
    jwt = response.body["jwt"]

    Unirest.default_header("Authorization", "Bearer #{jwt}")

    pp jwt

  elsif user_input == "9"

    jwt = ""
    Unirest.clear_default_headers()
    pp "User logged out"

  elsif user_input == "10"
    response = Unirest.get("#{base_url}/orders")
    pp response.body

  elsif user_input == "11"
    response = Unirest.get("#{base_url}/carted_products")
    pp response.body
    
  elsif user_input == "0"
    break
  end

end