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
    new_product.retailer_id = 1.to_i
  elsif new_product.retailer == "Rustica Sourdough Bakery"
    new_product.retailer_id = 2.to_i
  elsif new_product.retailer == "North Carlton Quality Meats"
    new_product.retailer_id = 3.to_i
  elsif new_product.retailer == "Melba's Food Hall"
    new_product.retailer_id = 4.to_i
  elsif new_product.retailer == "La Manna Fresh"
    new_product.retailer_id = 5.to_i
  elsif new_product.retailer == "Organics by La Manna Fresh"
    new_product.retailer_id = 6.to_i
  elsif new_product.retailer == "Taranto's Balwyn Fruit Supply"
    new_product.retailer_id = 7.to_i
  elsif new_product.retailer == "Kandi's Balwyn Heights Fruit Supply"
    new_product.retailer_id = 8.to_i
  end      
      
  new_product.save

end

all_retailers = Product.select(:retailer).distinct
all_retailers.each do |retail|
  new_retailer = Retailer.new
  new_retailer.name = all_retailers[retail].retailer

  new_retailer.save
end
