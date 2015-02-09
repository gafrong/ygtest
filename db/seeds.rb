# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

parsed = JSON.parse(File.read("db/products.json"))

Product.destroy_all
Retailer.destroy_all


parsed.each do |product|
  new_product = Product.new
  new_product.id = product["id"]
  new_product.name = product["name"]
  new_product.image = product["image"]
  new_product.price = product["price"]
  new_product.retailer = product["retailer"]
  if new_product.retailer == "YourGrocer"
    new_product.retailer_id = 1
  elsif new_product.retailer == "Rustica Sourdough Bakery"
    new_product.retailer_id = 2
  elsif new_product.retailer == "North Carlton Quality Meats"
    new_product.retailer_id = 3
  elsif new_product.retailer == "Melba's Food Hall"
    new_product.retailer_id = 4
  elsif new_product.retailer == "La Manna Fresh"
    new_product.retailer_id = 5
  elsif new_product.retailer == "Organics by La Manna Fresh"
    new_product.retailer_id = 6
  elsif new_product.retailer == "Taranto's Balwyn Fruit Supply"
    new_product.retailer_id = 7
  elsif new_product.retailer == "Kandi's Balwyn Heights Fruit Supply"
    new_product.retailer_id = 8
  end      
      
  new_product.save

end

all_retailers = Product.select(:retailer).distinct
all_retailers.count.times do |retail|
  new_retailer = Retailer.new
  new_retailer.name = all_retailers[retail].retailer

  new_retailer.save
end