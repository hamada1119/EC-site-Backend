# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
puts "Clearing existing data..."
CartItem.destroy_all
Product.destroy_all
Category.destroy_all

# Create categories
puts "Creating categories..."
categories = {
  fridge: Category.create!(name: "Fridge"),
  washer: Category.create!(name: "Washer"),
  kitchen: Category.create!(name: "Kitchen"),
  vacuum: Category.create!(name: "Vacuum"),
  climate: Category.create!(name: "Climate"),
  tv: Category.create!(name: "TV"),
  other: Category.create!(name: "Other")
}

puts "Categories created: #{Category.count}"

# Create products
puts "Creating products..."

# Fridges
Product.create!(
  product_name: "Smart Refrigerator Pro",
  category: categories[:fridge],
  price: 1299.99,
  rating: 4.5,
  is_sale: true,
  release_date: 60.days.ago,
  available_qty: 15
)

Product.create!(
  product_name: "Eco Fridge 500L",
  category: categories[:fridge],
  price: 899.99,
  rating: 4.2,
  is_sale: false,
  release_date: 20.days.ago,
  available_qty: 25
)

# Washers
Product.create!(
  product_name: "Ultra Wash 8000",
  category: categories[:washer],
  price: 749.99,
  rating: 4.7,
  is_sale: true,
  release_date: 45.days.ago,
  available_qty: 10
)

Product.create!(
  product_name: "QuickWash Compact",
  category: categories[:washer],
  price: 549.99,
  rating: 4.0,
  is_sale: false,
  release_date: 15.days.ago,
  available_qty: 30
)

# Kitchen appliances
Product.create!(
  product_name: "Multi-Function Blender",
  category: categories[:kitchen],
  price: 199.99,
  rating: 4.6,
  is_sale: false,
  release_date: 10.days.ago,
  available_qty: 50
)

Product.create!(
  product_name: "Smart Microwave Oven",
  category: categories[:kitchen],
  price: 349.99,
  rating: 4.3,
  is_sale: true,
  release_date: 90.days.ago,
  available_qty: 20
)

Product.create!(
  product_name: "Coffee Maker Deluxe",
  category: categories[:kitchen],
  price: 129.99,
  rating: 4.8,
  is_sale: false,
  release_date: 5.days.ago,
  available_qty: 40
)

# Vacuum cleaners
Product.create!(
  product_name: "RoboVac 3000",
  category: categories[:vacuum],
  price: 399.99,
  rating: 4.4,
  is_sale: false,
  release_date: 25.days.ago,
  available_qty: 18
)

Product.create!(
  product_name: "PowerClean Upright",
  category: categories[:vacuum],
  price: 249.99,
  rating: 4.1,
  is_sale: true,
  release_date: 120.days.ago,
  available_qty: 12
)

# Climate control
Product.create!(
  product_name: "Smart AC Unit 12000 BTU",
  category: categories[:climate],
  price: 599.99,
  rating: 4.5,
  is_sale: false,
  release_date: 30.days.ago,
  available_qty: 8
)

Product.create!(
  product_name: "Portable Heater Pro",
  category: categories[:climate],
  price: 149.99,
  rating: 4.2,
  is_sale: true,
  release_date: 100.days.ago,
  available_qty: 22
)

# TVs
Product.create!(
  product_name: '55" 4K Smart TV',
  category: categories[:tv],
  price: 799.99,
  rating: 4.6,
  is_sale: false,
  release_date: 18.days.ago,
  available_qty: 14
)

Product.create!(
  product_name: '65" OLED Ultra HD',
  category: categories[:tv],
  price: 1499.99,
  rating: 4.9,
  is_sale: true,
  release_date: 40.days.ago,
  available_qty: 6
)

Product.create!(
  product_name: '32" LED Display',
  category: categories[:tv],
  price: 299.99,
  rating: 4.0,
  is_sale: false,
  release_date: 80.days.ago,
  available_qty: 28
)

# Other
Product.create!(
  product_name: "Air Purifier XL",
  category: categories[:other],
  price: 279.99,
  rating: 4.4,
  is_sale: false,
  release_date: 12.days.ago,
  available_qty: 16
)

Product.create!(
  product_name: "Water Dispenser Smart",
  category: categories[:other],
  price: 189.99,
  rating: 4.1,
  is_sale: true,
  release_date: 70.days.ago,
  available_qty: 20
)

puts "Products created: #{Product.count}"
puts "Seed data successfully created!"
