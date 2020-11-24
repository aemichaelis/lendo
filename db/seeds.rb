# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "clearing the db..."

Booking.destroy_all

Product.destroy_all

User.destroy_all

puts "creating seeds..."

user = User.create(
  email: "paul@paul.com",
  password: "testing",
  )

product = Product.new(
  title: "almost new iPhone 8",
  description:"Beautiful both to look at and to use, that's the Apple iPhone 8.
  This model, which is unlocked to allow you to use any mobile network provider
  you desire, features a dazzling gold casing that really sets off the elegance
  of the overall design. The phone's high-resolution 4.7-inch screen is matched
  by a potent hexa-core processor with power to handle the toughest tasks.
  The phone's 12MP camera will let you take high-resolution photos, while you
  can stay connected via 4G and Wi-Fi.",
  address: "Pestalozzistraße 25, 10627 Berlin",
  category: "Phones & Mobile Tech",
  availability: "true",
  price: "20",
  accessories: "comes with charger (USB) and screen protection",
  condition: "Like New",
  model: "iPhone 8",
  brand: "Apple",
  delivery_method: "Flexible",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1560084157-d6ba2c88ad82?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3034&q=80')
workshop.photos.attach(io: file, filename: "product_01.png", content_type: 'image/png')

product.save!


puts "finished"
