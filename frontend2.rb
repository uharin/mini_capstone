require 'Unirest'
require 'pp'

system 'clear'

base_url = "http://localhost:3000"

p "Please select an option"
p "[1] Show all suppliers"
p "[2] Show a specific supplier"
p "[3] Create a supplier"
p "[4] Edit a supplier"
p "[5] Show delete suppliers"

user_choice = gets.chomp

if user_choice == "1"
  response = Unirest.get("#{base_url}/suppliers")
  suppliers_list = response.body
  pp suppliers_list

elsif user_choice == "2"
  p "Please enter the id for the supplier you would like to view"
  user_choice = gets.chomp
  response = Unirest.get("#{base_url}/suppliers/#{user_choice}")
  supplier = response.body
  pp supplier

elsif user_choice == "3"
  the_parameters = {}
  p "What is the supplier's name?"
  the_parameters['name'] = gets.chomp
  p "What is the supplier's email?"
  the_parameters['email'] = gets.chomp
  p "What is the supplier's phone number?"
  the_parameters['phone_number'] = gets.chomp
  response = Unirest.post("#{base_url}/suppliers", parameters: the_parameters)
  pp response.body

elsif user_choice == "4"


elsif user_choice == "5"

end