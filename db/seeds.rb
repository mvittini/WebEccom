# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy
Review.destroy

products = []

(1..50).each do |m|
  products << Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(2, true, 10),
    price: Faker::Number.between(100, 100000),
    stock: Faker::Number.between(1, 99)
  )
end

reviews = []

(1..300).each do |r|
  reviews << Review.create(
    content: Faker::Lorem.paragraph(3),
    product: products[rand(products.length)]
  )
end