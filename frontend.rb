require 'unirest'

response = Unirest.get("http://localhost:3000/products")

product_list = response.body

