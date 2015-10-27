# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Product.destroy_all
Review.destroy_all

users = []

users << User.create(
  name: 'Marco',
  lastname: 'Vittini',
  username: 'mvittini',
  email: 'mvittini@live.cl',
  password: 'password',
  role: 'admin'
)
users << User.create(
  name: 'Nati',
  lastname: 'Dias',
  username: 'ndias',
  email: 'nati@live.cl',
  password: 'password',
  role: 'client'
)
users << User.create(
  name: 'Daniel',
  lastname: 'Concha',
  username: 'dconcha',
  email: 'dani@live.cl',
  password: 'password',
  role: 'guest'
)

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
    product: products[rand(products.length)],
    user: users[rand(users.length)]
  )
end