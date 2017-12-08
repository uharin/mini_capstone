require 'unirest'
require 'pp'

system "clear"

base_url = "http://localhost:3000"

p "Choose an option"
p "[1] see all products"
p "[2] see a particular product"
p "[3] add an product"
p "[4] edit a product"
p "[5] delete a product"

user_input = gets.chomp.to_i


if user_input == 1
  response = Unirest.get("#{base_url}/products")
  product_list = response.body
  pp product_list
elsif user_input == 2
  p "Enter the ID for the product you wish to view"
  product_id = gets.chomp.to_i
  response = Unirest.get("#{base_url}/products/#{product_id}")
  product = response.body
  pp product
elsif user_input == 3
  the_parameters = {}
  p "Please enter the product's name"
  the_parameters['name'] = gets.chomp
  p "Please enter the product's price"
  the_parameters['price'] = gets.chomp.to_i
  p "Please enter the product's vendor"
  the_parameters['vendor'] = gets.chomp
  p "Please enter the product's description"
  the_parameters['description'] = gets.chomp
  response = Unirest.post("#{base_url}/products", parameters: the_parameters)
  pp response.body
elsif user_input == 4
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
  p "Please enter the product's vendor"
  the_parameters['vendor'] = gets.chomp
  p "Please enter the product's description"
  the_parameters['description'] = gets.chomp
  response = Unirest.patch("#{base_url}/products/#{product_id}", parameters: the_parameters)
  pp response.body
elsif user_input == 5
  p "Please enter the ID for the product you wish to delete"
  product_id = gets.chomp.to_i
  response = Unirest.delete("#{base_url}/products/#{product_id}")
  p "You deleted a message with the ID of #{product_id}"
end 