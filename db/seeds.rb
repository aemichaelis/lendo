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
  username: "Paul",
  password: "testing"
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
  price: "7",
  accessories: "comes with charger (USB) and screen protection",
  condition: "Like New",
  model: "iPhone 8",
  brand: "Apple",
  delivery_method: "Flexible",
  )
product.user = user

file_01 = URI.open('https://images.unsplash.com/photo-1579905595163-07fdce0d4cf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80')
file_02 = URI.open('https://static.techspot.com/images2/news/bigimage/2020/06/2020-06-26-image-2.jpg')
product.photos.attach(io: file_01, filename: "product_01_1.png", content_type: 'image/png')
product.photos.attach(io: file_02, filename: "product_01_2.png", content_type: 'image/png')


product.save!

product = Product.new(
  title: "iPhone 11",
  description:"Fantastic condition iPhone 11 pro. This phone has been in a
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
  price: "10",
  accessories: "USB-charger, screen protection, heavy-duty case",
  condition: "Like New",
  model: "iPhone 11 Pro",
  brand: "Apple",
  delivery_method: "Delivery",
  )
product.user = user

file_1 = URI.open('https://images.unsplash.com/photo-1592286927505-1def25115558?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1574831986634-daead86723b1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2382&q=80')
product.photos.attach(io: file_1, filename: "product_02_1.png", content_type: 'image/png')
product.photos.attach(io: file_2, filename: "product_02_2.png", content_type: 'image/png')

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
  price: "11",
  accessories: "SD 64GB, 18-25mm VR Zoom Lens Kit, two Nikon EN-EL14a Batteries with charger",
  condition: "Minor Cosmetic Faults",
  model: "D3400 DSLR Camera",
  brand: "Nikon",
  delivery_method: "Flexible",
  )
product.user = user

file_01 = URI.open('https://images.unsplash.com/photo-1543915477-f351326188c7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8bmlrb24lMjBkMzQwMCUyMGNhbWVyYXxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=900&q=60')
file_02 = URI.open('https://images.unsplash.com/photo-1600368140372-9052d7ab55a1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')
product.photos.attach(io: file_01, filename: "product_03_1.png", content_type: 'image/png')
product.photos.attach(io: file_02, filename: "product_03_2.png", content_type: 'image/png')

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
  price: "21",
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
  address: "Ständehausstraße 1, 40217 Düsseldorf",
  category: "Phones & Mobile Tech",
  price: "19",
  accessories: "128 GB Capacity, Apple Pencil and charger included",
  condition: "Normal Wear",
  model: "iPad Pro 2019",
  brand: "Apple",
  delivery_method: "Flexible",
  )
product.user = user

file = URI.open('https://images.unsplash.com/photo-1542751110-97427bbecf20?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1876&q=80')
product.photos.attach(io: file, filename: "product_05.png", content_type: 'image/png')

product.save!

product_06 = Product.new(
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
  price: "3",
  accessories: "Gamepad only (Playstation/chargers not included)",
  condition: "Normal Wear",
  model: "DualShock 4",
  brand: "Sony",
  delivery_method: "Delivery",
  )
product_06.user = user

file = URI.open('https://images.unsplash.com/photo-1585369111972-771555a164c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80')
product_06.photos.attach(io: file, filename: "product_06.png", content_type: 'image/png')

product_06.save!

product_07 = Product.new(
  title: "iPhone 11 with lots of gadgets",
  description:"Apple iPhone 11 Pro Max - 256GB - Midnight Green (Unlocked) A2218
  (CDMA + GSM). Excellent condition, the front and back are great, a few small
  marks around the metal edges, not sure if you can see them in the photos. 92% battery health.
  Includes USB-C to lightning cable, or if you prefer an apple original 5w charger
  and cable, just let me know which you prefer when buying. Will throw in clear silicon case too.",
  address: "Albrechtstraße 96, 12167 Berlin",
  category: "Phones & Mobile Tech",
  price: "16",
  accessories: "AirPods, charger and protective Case included",
  condition: "Normal Wear",
  model: "iPhone 11 Pro",
  brand: "Apple",
  delivery_method: "Flexible",
  )
product_07.user = user

file = URI.open('https://images.unsplash.com/photo-1565536421961-1f165e0c981e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')
product_07.photos.attach(io: file, filename: "product_07.png", content_type: 'image/png')

product_07.save!

product = Product.new(
  title: "brand new Google phone",
  description:"Google pixel 4a, brand New, 128gb. Just Black, still Sealed in Box.
  Only renting it out because its an unwanted Gift and receipt has been lost.
  Dispatched with Royal Mail 1st Class or Collection from DA9",
  address: "Ahornstraße 16A, 12163 Berlin",
  category: "Phones & Mobile Tech",
  price: "8",
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
  title: "classic analogue SL Camera",
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
  price: "6",
  accessories: "35mm lens, batteries, Nikon strap, Manual Book",
  condition: "Minor Cosmetic Faults",
  model: "F1",
  brand: "Nikon",
  delivery_method: "Pick up",
  )
product_09.user = user

file_1 = URI.open('https://images.unsplash.com/photo-1487004820913-ccbc3ebb15d8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8OTR8fG5pa29uJTIwZjF8ZW58MHx8MHw%3D&auto=format&fit=crop&w=900&q=60')
file_2 = URI.open('https://images.unsplash.com/photo-1564177426295-5b1fe9e778f6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')
file_3 = URI.open('https://images.unsplash.com/photo-1596972811652-11d30aa10342?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1952&q=80')
product_09.photos.attach(io: file_1, filename: "product_09_1.png", content_type: 'image/png')
product_09.photos.attach(io: file_2, filename: "product_09_2.png", content_type: 'image/png')
product_09.photos.attach(io: file_3, filename: "product_09_3.png", content_type: 'image/png')

product_09.save!

product_10 = Product.new(
  title: "Canon DLSR camera in good condition",
  description:"Canon EOS 6D with 28-105mm lens and extras for instant start-up photographers.
  Dispatched with Royal Mail 2nd Class. This is a stunning example of Canons great Features,
  please look up full Tech-Info on Canon Website. It's a lovely camera for a good price.
  As a photographer I would snap this up!
  Any Questions, just shoot me a message. The items will be rented in the condition as shown in pictures, safely packed.",
  address: "Crellestraße 26, 10827 Berlin",
  category: "Cameras",
  price: "13",
  accessories: "28-105 mm lens, two rechargeable batteries with charger, Camera strap",
  condition: "Normal Wear",
  model: "EOS 6D",
  brand: "Canon",
  delivery_method: "Flexible",
  )
product_10.user = user

file_1 = URI.open('https://images.unsplash.com/photo-1551194201-5b634bd23931?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1525385444278-b7968e7e28dc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')
product_10.photos.attach(io: file_1, filename: "product_10_1.png", content_type: 'image/png')
product_10.photos.attach(io: file_2, filename: "product_10_2.png", content_type: 'image/png')

product_10.save!

product_11 = Product.new(
  title: "Vintage Minolta XG-M",
  description:"You are viewing a Vintage Minolta XG-M 35mm SLR Film Camera. Comes with a
  RMC Tokina 28-70mm 1:3.5-4.5 Lens. There is no film included with this camera!
  Firstly, this camera comes in worn condition with areas of wear.
  The black material to the exterior of the camera has turned grey in areas due to age and marks (as shown in photo).
  There is some marks and sticker residue to the bottom.
  The view finder has some small dirt and small dust marks but the lens adjusts fine.
  Please check photos for a better indication of condition!
  This is a GREAT camera!
  If you have any questions feel free to ask.",
  address: "Venloer Str. 760, 50827 Köln",
  category: "Cameras",
  price: "7",
  accessories: "35 mm lens, Manual",
  condition: "Minor Cosmetic Faults",
  model: "XG-M",
  brand: "Minolta",
  delivery_method: "Delivery",
  )
product_11.user = user

file_1 = URI.open('https://images.unsplash.com/photo-1542124292-60272943a355?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1951&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1542124061437-b227f39e39a9?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60')
product_11.photos.attach(io: file_1, filename: "product_11_1.png", content_type: 'image/png')
product_11.photos.attach(io: file_2, filename: "product_11_2.png", content_type: 'image/png')

product_11.save!

product_12 = Product.new(
  title: "Sony Alpha Digital Mirrorless Camera",
  description:"My current fave in my personal collection, and although I prefer using this even over my bulky
  but beautiful Canon 5d4, the time to downsize has come, and i'd love to see this kit go to another home
  where its infamous low light capabilities (best in price range by quite some margin) are loved and appreciated!
  Condition is very good. No artifacts in lenses, and all items in exceptional working order.
  Happysnaps guaranteed!",
  address: "Schwarzburger Str. 4, 51103 Köln",
  category: "Cameras",
  price: "15",
  accessories: "comes with 16-50mm official Sony lens, 4 extra batteries, charger, data transfer cable, microfiber cloth and lens wipes",
  condition: "Normal Wear",
  model: "A7 III",
  brand: "Sony",
  delivery_method: "Flexible",
  )
product_12.user = user

file_1 = URI.open('https://images.unsplash.com/photo-1570355661836-766cd1ae366c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1581423793081-2c07e7a0b92e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')
product_12.photos.attach(io: file_1, filename: "product_12_1.png", content_type: 'image/png')
product_12.photos.attach(io: file_2, filename: "product_12_2.png", content_type: 'image/png')

product_12.save!

product_13 = Product.new(
  title: "Fujifilm instax mini 8 instant film camera",
  description:"Fujifilm instax mini 8 instant film camera White with Carry Case.
  Capture all your special moments with the Fujifilm Mini 8 Instant film camera.
  The Instax mini Instant Color Film film camera with its Auto focus mode enables
  you to get the desired photo composition right.
  With Flash, Film not included.",
  address: "Hardenbergstraße 33, 10623 Berlin",
  category: "Cameras",
  price: "9",
  accessories: "Comes with carry case",
  condition: "Like New",
  model: "instax mini 8",
  brand: "Fujifilm",
  delivery_method: "Pick up",
  )
product_13.user = user

file_1 = URI.open('https://images.unsplash.com/photo-1600200952161-dea190aad54c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1500051638674-ff996a0ec29e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1992&q=80')
product_13.photos.attach(io: file_1, filename: "product_13_1.png", content_type: 'image/png')
product_13.photos.attach(io: file_2, filename: "product_13_2.png", content_type: 'image/png')

product_13.save!


product_14 = Product.new(
  title: "iPad silver",
  description:"Apple iPad Pro 2020 11” 128GB 4g/wifi. Lovely condition, always been in a case.
  Couple of tiny little scuffs on the screen, barely noticeable to be honest.
  I only mention to be completely transparent. Really nice condition. Comes with case too.
  Purchased from Vodafone 6 months ago.",
  address: "Berger Str. 1, 40213 Düsseldorf",
  category: "Phones & Mobile Tech",
  price: "14",
  accessories: "charger, Apple Pencil (Gen 1) and Smart Case included",
  condition: "Normal Wear",
  model: "iPad 2020",
  brand: "Apple",
  delivery_method: "Pick up",
  )
product_14.user = user

file_1 = URI.open('https://images.unsplash.com/photo-1539883305165-f691affc6c54?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80')
file_2 = URI.open('https://images.unsplash.com/photo-1525101238777-8878781fc06d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80')
product_14.photos.attach(io: file_1, filename: "product_14_1.png", content_type: 'image/png')
product_14.photos.attach(io: file_2, filename: "product_14_2.png", content_type: 'image/png')

product_14.save!

product_15 = Product.new(
  title: "Samsung Serif TV 43 inches",
  description:"The Samsung SERIF TV includes all of the features that you desire from a television:
  a 4K UHD resolution which provides four times the resolution of full HD TVs and HDR Premium technology
  to enhance the picture’s color and brightness while creating a more natural, realistic image.
  A true collaboration with acclaimed Parisian design duo Ronan and Erwan Bouroullec,
  the Samsung SERIF TV redefines the television experience.
  As a Smart TV, it also includes a quad-core processor for a fluid browsing experience and seamless
  switching between live TV, apps and streaming content.",
  address: "Osdorfer Landstraße 1a, 22607 Hamburg",
  category: "Home",
  price: "21",
  accessories: "icluding stand, remote and all cables that are needed",
  condition: "Like New",
  model: "Serif 2.0",
  brand: "Samsung",
  delivery_method: "Flexible",
  )
product_15.user = user

file_1 = URI.open('https://shop.fux-ag.ch/images/product_images/original_images/Samsung-Serif-02-Fux-AG_863_0.jpg')
product_15.photos.attach(io: file_1, filename: "product_15_1.png", content_type: 'image/png')

product_15.save!


puts "create bookings, chatrooms and reviews..."

user_second = User.create(
  email: "alex@alex.com",
  password: "testing",
  username: "Alex"
  )

user_3 = User.create(
  email: "santi@lewagon.com",
  password: "testing",
  username: "Santi"
  )

user_4 = User.create(
  email: "sarah@lewagon.com",
  password: "testing",
  username: "Sarah"
  )

booking = Booking.new(

  check_in: "2020-12-06",
  check_out: "2020-12-10",
  confirmed: "pending",
  status: 0,
  )
booking.product = product_06
booking.user = user_second

booking.save!

review_1 = Review.new(rating: 5, description: "Item as described and good communication. Jessica is an awesome photographer and was able to help me with lots of things. Thanks!")
review_1.booking = booking
review_1.product_id = booking.product_id

review_1.save!

chatroom1 = Chatroom.create(name: booking.product.title)
chatroom1.booking = booking
chatroom1.p1_id = booking.user.id
chatroom1.p2_id = booking.product.user.id
chatroom1.save

booking = Booking.new(

  check_in: "2020-12-13",
  check_out: "2020-12-20",
  confirmed: "pending",
  status: 0,
  )
booking.product = product_07
booking.user = user_second

booking.save!

chatroom2 = Chatroom.create(name: booking.product.title)
chatroom2.booking = booking
chatroom2.p1_id = booking.user.id
chatroom2.p2_id = booking.product.user.id
chatroom2.save

booking = Booking.new(

  check_in: "2020-10-01",
  check_out: "2020-11-01",
  confirmed: "previous",
  status: 2,
  )
booking.product = product_13
booking.user = user_3

booking.save!

review_2 = Review.new(rating: 4, description: "It has a certain retrotouch that you consciously choose with this type of camera. Completely detached from the megapixel madness you can shoot beautiful snapshots here very relaxed and can stick them directly or press your loved one in the hand. A beautiful resurrected photo experience. ")
review_2.booking = booking
review_2.product_id = booking.product_id

review_2.save!


booking = Booking.new(

  check_in: "2020-08-13",
  check_out: "2020-08-30",
  confirmed: "previous",
  status: 2,
  )
booking.product = product_13
booking.user = user_4

booking.save!

review_3 = Review.new(rating: 5, description: "Communication with Alex was easy and nice. The mini is excellent workmanship, sits well in the hand and generally makes a good impression. Shoot
pictures with this camera is very easy and with the included lens you can also take sharp pictures in close range.")
review_3.booking = booking
review_3.product_id = booking.product_id

review_3.save!



puts "finished"










