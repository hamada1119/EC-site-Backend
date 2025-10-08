# db/seeds.rb
# カテゴリ作成
categories = {
  'Fridge' => Category.find_or_create_by(name: 'Fridge'),
  'Washer' => Category.find_or_create_by(name: 'Washer'),
  'Kitchen' => Category.find_or_create_by(name: 'Kitchen'),
  'Vacuum' => Category.find_or_create_by(name: 'Vacuum'),
  'Climate' => Category.find_or_create_by(name: 'Climate'),
  'TV' => Category.find_or_create_by(name: 'TV'),
  'Other' => Category.find_or_create_by(name: 'Other')
}

# 商品データ
products_data = [
  { product_name: 'French Door Fridge', category: 'Fridge', price: 2200, rating: 4, is_sale: false, release_date: '2024-02-01', available_qty: 3 },
  { product_name: 'Side-by-Side Fridge', category: 'Fridge', price: 1700, rating: 5, is_sale: false, release_date: '2023-03-22', available_qty: 0 },
  { product_name: 'Top-Freezer Fridge', category: 'Fridge', price: 1100, rating: 3, is_sale: true, release_date: '2023-01-10', available_qty: 5 },
  { product_name: 'Front Load Washer', category: 'Washer', price: 800, rating: 5, is_sale: false, release_date: '2022-12-30', available_qty: 0 },
  { product_name: 'Top Load Washer', category: 'Washer', price: 700, rating: 3, is_sale: true, release_date: '2023-02-14', available_qty: 2 },
  { product_name: 'OTR Microwave', category: 'Kitchen', price: 250, rating: 1, is_sale: false, release_date: '2023-04-08', available_qty: 8 },
  { product_name: 'Stand Mixer', category: 'Kitchen', price: 350, rating: 3, is_sale: true, release_date: '2023-05-28', available_qty: 3 },
  { product_name: 'High-Power Vacuum', category: 'Vacuum', price: 450, rating: 2, is_sale: false, release_date: '2023-01-17', available_qty: 0 },
  { product_name: 'Robot Vacuum', category: 'Vacuum', price: 650, rating: 5, is_sale: true, release_date: '2023-03-11', available_qty: 1 },
  { product_name: 'Air Purifier & Heater', category: 'Climate', price: 400, rating: 1, is_sale: false, release_date: '2022-11-25', available_qty: 2 },
  { product_name: 'Evaporative Cooler', category: 'Climate', price: 300, rating: 2, is_sale: false, release_date: '2023-02-05', available_qty: 4 },
  { product_name: '65 Inch 4K TV', category: 'TV', price: 1100, rating: 4, is_sale: false, release_date: '2024-04-21', available_qty: 7 },
  { product_name: 'OLED TV', category: 'TV', price: 2000, rating: 3, is_sale: false, release_date: '2023-01-03', available_qty: 2 },
  { product_name: 'Mini TV', category: 'TV', price: 250, rating: 2, is_sale: true, release_date: '2023-01-10', available_qty: 5 },
  { product_name: 'Compact TV', category: 'TV', price: 300, rating: 5, is_sale: true, release_date: '2023-01-10', available_qty: 5 }
]

# 商品作成
products_data.each do |data|
  Product.create!(
    product_name: data[:product_name],
    category: categories[data[:category]],
    price: data[:price],
    rating: data[:rating],
    is_sale: data[:is_sale],
    release_date: data[:release_date],
    available_qty: data[:available_qty]
  )
end

puts "#{Product.count} products created!"