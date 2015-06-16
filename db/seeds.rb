# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rachel = User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password")
jeff = User.create(full_name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", password: "password", display_name: "J3")
jorge = User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", display_name: "novohispano")
josh = User.create(full_name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", password: "password", display_name: "josh", role: 1)

dairy = Category.create(name: "dairy")
meat = Category.create(name: "meat")
fruit = Category.create(name: "fruit")
veg = Category.create(name: "vegetables")
baked = Category.create(name: "baked goods")

order_1  = rachel.orders.create
order_2  = jeff.orders.create
order_3  = jorge.orders.create
order_4  = rachel.orders.create(status: 1)
order_5  = jeff.orders.create(status: 1)
order_6  = rachel.orders.create(status: 1)
order_7  = rachel.orders.create(status: 2)
order_8  = jorge.orders.create(status: 2)
order_9  = jeff.orders.create(status: 3)
order_10 = jorge.orders.create(status: 3)

dairy.items.create(title: "fresh milk", description: "straight from the udder.", price: 500)
dairy.items.create(title: "butter", description: "smooth and creamy", price: 400)
dairy.items.create(title: "eggs", description: "trust me, it's dairy", price: 350)
dairy.items.create(title: "ice cream", description: "it's milk and butter, but frozen", price: 750)
dairy.items.create(title: "cheese", description: "it doesn't get any better than our cheese", price: 840)

meat.items.create(title: "beef", description: "our beef comes from cows", price: 300)
meat.items.create(title: "pork", description: "pigs are cute, bacon is better", price: 900)
meat.items.create(title: "chicken", description: "can you believe eggs are dairy", price: 375)
meat.items.create(title: "lamb", description: "get shanked", price: 500)
meat.items.create(title: "walleye", description: "some people eat fish", price: 125)

fruit.items.create(title: "strawberries", description: "plump, red and sweet", price: 400)
fruit.items.create(title: "blueberries", description: "plump, blue and sweet", price: 350)
fruit.items.create(title: "peaches", description: "that's just peachy", price: 120)
fruit.items.create(title: "watermelon", description: "great for a summer day", price: 900)
fruit.items.create(title: "apples", description: "crisp, delicious and good for juice", price: 90)

veg.items.create(title: "cucumbers", description: "big ass cucumbers", price: 220)
veg.items.create(title: "broccoli", description: "it's really good for you", price: 70)
veg.items.create(title: "carrots", description: "if it's good enough for bunnies", price: 45)
veg.items.create(title: "green beans", description: "these beans are green", price: 310)
veg.items.create(title: "spinach", description: "eat your leafy greens", price: 1000)

baked.items.create(title: "apple pie", description: "american made", price: 1500)
baked.items.create(title: "sugar cookies", description: "momma's recipe", price: 700)
baked.items.create(title: "challah bread", description: "holllla", price: 1100)
baked.items.create(title: "brownies", description: "welcome to brown town", price: 900)
baked.items.create(title: "rhubarb pie", description: "better get some ice cream", price: 10000)

order_1.order_items.create(item_id: 1, quantity: 2)
order_1.order_items.create(item_id: 2, quantity: 1)
order_2.order_items.create(item_id: 3, quantity: 24)
order_2.order_items.create(item_id: 1, quantity: 5)
order_3.order_items.create(item_id: 11, quantity: 1)
order_3.order_items.create(item_id: 20, quantity: 2)
order_4.order_items.create(item_id: 13, quantity: 7)
order_4.order_items.create(item_id: 5, quantity: 3)
order_5.order_items.create(item_id: 8, quantity: 12)
order_6.order_items.create(item_id: 17, quantity: 9)
order_6.order_items.create(item_id: 16, quantity: 15)
order_6.order_items.create(item_id: 15, quantity: 50)
order_6.order_items.create(item_id: 1, quantity: 20)
order_7.order_items.create(item_id: 4, quantity: 1)
order_8.order_items.create(item_id: 6, quantity: 3)
order_9.order_items.create(item_id: 9, quantity: 9)
order_10.order_items.create(item_id: 12, quantity: 2)
