

# product1 = Product.new(name: "Goggles", price: 12, image: "test", description: "To help you see under water")
# product2 = Product.new(name: "Boots", price: 23, image: "test", description: "To help you walk up mountains")
# product3 = Product.new(name: "Grappling Hook", price: 34, image: "test", description: "To help you get to high places")

# product1.save
# product2.save
# product3.save

50.times do 
  product = Product.new({
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    image: Faker::Commerce.material,
    description: Faker::Commerce.department})
  product.save
end
