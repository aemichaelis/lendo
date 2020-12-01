# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "clearing the db..."

Favourite.destroy_all

Review.destroy_all

Chatroom.destroy_all

Booking.destroy_all

Product.destroy_all

User.destroy_all

puts "creating products..."

user = User.create(
  email: "paul@paul.com",
  username: "Paul"
  password: "testing",
  )
user.avatar.attach(
  io: File.open(
    Rails.root.join(
      'app', 'assets', 'images', 'little_paul.jpeg'
    )
  ), filename: 'little_paul.jpeg',
  content_type: 'image/png'
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
  price: "20",
  accessories: "comes with charger (USB) and screen protection",
  condition: "Like New",
  model: "iPhone 8",
  brand: "Apple",
  delivery_method: "Flexible",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1560084157-d6ba2c88ad82?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3034&q=80')
product.photos.attach(io: file, filename: "product_01.png", content_type: 'image/png')

product.save!

product = Product.new(
  title: "immaculate iPhone 11",
  description:"Fantastic mint condition iPhone 11 pro, this phone has been in a
  top quality heavy duty protection case and screen guard which is still on the
  screen since the moment it was taken out of the box from new 5 months ago. I've
  used it sporadically but not always as i prefer my Android and I've now decided
  iPhone's are not for me. I want to just stick with Android phones as i personally
  think you can do more on Android phones and i really don't like Apple as a
  company, anyway this phone is in immaculate, as new as the day i bought it to be honest.
  This phone is gift quality and i'd say probably the best quality opened phone you will find.
  postage will be super fast 1st class signed for.",
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  category: "Phones & Mobile Tech",
  price: "45",
  accessories: "USB-charger, screen protection, heavy-duty case",
  condition: "Like New",
  model: "iPhone 11 Pro",
  brand: "Apple",
  delivery_method: "Delivery",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1596558450268-9c27524ba856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1825&q=80')
product.photos.attach(io: file, filename: "product_02.png", content_type: 'image/png')

product.save!

product = Product.new(
  title: "take brilliant Photos with this DSLR camera",
  description:"A sleek and now connected DSLR for all, the black Nikon D3400 is
  designed to produce better image quality than your smartphone, yet work seamlessly
  with your mobile devices for sharing your memories. Utilizing a DX-format 24.2MP
  CMOS sensor and EXPEED 4 image processor, this camera provides a native sensitivity
  range from ISO 100-25600 to suit working in a variety of lighting conditions, and
  the sensor and processor combination also provides a 5 fps continuous shooting
  rate as well as Full HD 1080p video recording at 60 fps. The sensor's design
  also omits an optical low-pass filter in order to achieve greater sharpness and
  resolution from both photos and videos.",
  address: "Friedrich-Olbricht-Damm 40, 13627 Berlin",
  category: "Cameras",
  price: "25",
  accessories: "SD 64GB, 18-25mm VR Zoom Lens Kit, two Nikon EN-EL14a Batteries with charger",
  condition: "Minor Cosmetic Faults",
  model: "D3400 DSLR Camera",
  brand: "Nikon",
  delivery_method: "Flexible",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1543915477-f351326188c7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8bmlrb24lMjBkMzQwMCUyMGNhbWVyYXxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=900&q=60')
product.photos.attach(io: file, filename: "product_03.png", content_type: 'image/png')

product.save!

product = Product.new(
  title: "MacBook Pro for office work",
  description:"This laptop is in superb condition. I purchased it about 8 months ago,
  so is still covered by apple care, and has been kept in my office, in a protective
  shell (also included). It hasn't even left the house. Come to think of it, neither have I...
  It comes with the original box and all the packaging, all kept on A1 condition,
  just like the mac itself. As you'll see in the final picture, the laptop has completed 54
  battery cycles. I have to sell my computers relatively often, with changes in
  the way I work coming frequently, so I know what it takes to get a laptop ready
  for sale. Check my feedback for testament to that. Naturally, the laptop will
  come free of icloud and ready for you to set up as your own. I hope I've managed to
  show everything that's relevant in my pictures. But if you still have any questions
  you'd like to ask, please do!
  Shipping will be via UPS, unless the buyer requests otherwise.
  I don't have a problem with shipping overseas via the global shipping program.
  Collection from Norwich city centre is also possible.",
  address: "Tauentzienstraße 24, 10789 Berlin",
  category: "Computers",
  price: "30",
  accessories: "16 GB RAM, 1 TB SSD Capacity, protective shell and charger included",
  condition: "Like New",
  model: "MacBook Pro 2019",
  brand: "Apple",
  delivery_method: "Flexible",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1530374260450-4bd19102f63d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')
product.photos.attach(io: file, filename: "product_04.png", content_type: 'image/png')

product.save!

product = Product.new(
  title: "iPad Pro, perfect for artists",
  description:"The space grey Apple iPad Pro tablet sports a 12.9-inch retina
  display with a resolution of 2732x2048 pixels. Powered by the A9X chip and M9
  motion coprocessor, it provides high speed and efficiency. This Wi-Fi model
  has a storage capacity of 128 GB, and runs on the iOS operating system. It
  features an 8 MP iSight camera, allowing you to capture sharp and detailed
  photographs. In addition, this tablet supports the Smart Keyboard and the
  Apple Pencil.",
  address: "Eisenbahnstraße 42, 10997 Berlin",
  category: "Phones & Mobile Tech",
  price: "45",
  accessories: "128 GB Capacity, Apple Pencil and charger included",
  condition: "Normal Wear",
  model: "iPad Pro 2019",
  brand: "Apple",
  delivery_method: "Flexible",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1569697150535-94fb89f890be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80')
product.photos.attach(io: file, filename: "product_05.png", content_type: 'image/png')

product.save!

product = Product.new(
  title: "PS4 controller",
  description:"Need an extra controller for the next gaming session with your friends?
  Enjoy precise gaming control with the Sony DualShock 4 gaming controller. The
  highly sensitive Six-Axis sensor along with the touchpad at the top of this
  wireless controller ensures an enhanced control. This gaming controller can be
  used with PS4 gaming consoles. In addition, it lets you share your accomplishments
  and recorded videos instantly with a conveniently placed and easily accessible
  Share button.",
  address: "Spandauer Damm 10, 14059 Berlin",
  category: "Gaming",
  price: "7",
  accessories: "Gamepad only (Playstation/chargers not included)",
  condition: "Normal Wear",
  model: "DualShock 4",
  brand: "Sony",
  delivery_method: "Delivery",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1585369111972-771555a164c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80')
product.photos.attach(io: file, filename: "product_06.png", content_type: 'image/png')

product.save!

product = Product.new(
  title: "iPhone 11 with lots of gadgets",
  description:"Apple iPhone 11 Pro Max - 256GB - Midnight Green (Unlocked) A2218
  (CDMA + GSM). Excellent condition, the front and back are great, a few small
  marks around the metal edges, not sure if you can see them in the photos. 92% battery health.
  Includes USB-C to lightning cable, or if you prefer an apple original 5w charger
  and cable, just let me know which you prefer when buying. Will throw in clear silicon case too.",
  address: "Albrechtstraße 96, 12167 Berlin",
  category: "Phones & Mobile Tech",
  price: "47",
  accessories: "AirPods, charger and protective Case included",
  condition: "Normal Wear",
  model: "iPhone 11 Pro",
  brand: "Apple",
  delivery_method: "Flexible",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1603898037225-1bea09c550c0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fGlwaG9uZSUyMDExJTIwcHJvJTIwbWF4fGVufDB8fDB8&auto=format&fit=crop&w=900&q=60')
product.photos.attach(io: file, filename: "product_07.png", content_type: 'image/png')

product.save!

product = Product.new(
  title: "brand new Google phone",
  description:"Google pixel 4a, brand New, 128gb. Just Black, still Sealed in Box.
  Only renting it out because its an unwanted Gift and receipt has been lost.
  Dispatched with Royal Mail 1st Class or Collection from DA9",
  address: "Ahornstraße 16A, 12163 Berlin",
  category: "Phones & Mobile Tech",
  price: "27",
  accessories: "charger and Screenprotection included",
  condition: "Like New",
  model: "Google pixel 4a",
  brand: "Android",
  delivery_method: "Flexible",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1598965402089-897ce52e8355?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2386&q=80')
product.photos.attach(io: file, filename: "product_08.png", content_type: 'image/png')

product.save!

product_09 = Product.new(
  title: "A classic of analogue SL Cameras",
  description:"Camera has been fully serviced & comes with a 6 month Warranty;
  the film winder, shutter timings & light meter have all been checked & are true.
  Nice example of a benchmark Nikon semi automatic with a fast standard lens - clear glass
  & smooth focus. Camera is in Berlin - so no duty, quick delivery & easy
  communications. Comes with batteries, a Nikon strap & a copy of 'Soap and Rocket'
  - a photo'zine all about analog photography :-)
  Postage will be Royal Mail / signed for € 8.60DE / € 20.00 Europe (1.2kg)
  Please email to ask any questions about this item, or analog photography in general.",
  address: "Invalidenstraße 43, 10115 Berlin",
  category: "Cameras",
  price: "18",
  accessories: "35mm lens, batteries, Nikon strap, Manual Book",
  condition: "Minor Cosmetic Faults",
  model: "F1",
  brand: "Nikon",
  delivery_method: "Pick up",
  )
product_09.user = user

file = URI.open('https://images.unsplash.com/photo-1487004820913-ccbc3ebb15d8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8OTR8fG5pa29uJTIwZjF8ZW58MHx8MHw%3D&auto=format&fit=crop&w=900&q=60')
product_09.photos.attach(io: file, filename: "product_09.png", content_type: 'image/png')

product_09.save!

product_10 = Product.new(
  title: "mint condition Canon DLSR camera",
  description:"Canon EOS 6D with 28-105mm lens and extras for instant start-up photographers.
  Dispatched with Royal Mail 2nd Class. This is a stunning example of Canons great Features,
  please look up full Tech-Info on Canon Website. It's a lovely camera for a good price.
  As a photographer I would snap this up!
  Any Questions, just shoot me a message. The items will be rented in the condition as shown in pictures, safely packed.",
  address: "Crellestraße 26, 10827 Berlin",
  category: "Cameras",
  price: "24",
  accessories: "28-105 mm lens, two rechargeable batteries with charger, Camera strap",
  condition: "Normal Wear",
  model: "EOS 6D",
  brand: "Canon",
  delivery_method: "Flexible",
  )
product_10.user = user

file = URI.open('https://images.unsplash.com/photo-1551194201-5b634bd23931?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')
product_10.photos.attach(io: file, filename: "product_10.png", content_type: 'image/png')

product_10.save!

puts "create bookings..."

user_second = User.create(
  email: "alex@alex.com",
  password: "testing",
  )

booking = Booking.new(
  check_in: "2020-11-24",
  check_out: "2020-11-26",
  confirmed: "pending",
  status: 0,
  )
booking.product = product_10
booking.user = user_second

booking.save!

booking = Booking.new(
  check_in: "2020-12-02",
  check_out: "2021-12-09",
  confirmed: "pending",
  status: 0,
  )
booking.product = product_09
booking.user = user_second

booking.save!

puts "finished"










