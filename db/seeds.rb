# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category = Category.create(name: "Fitness", description: "Fitness products")
sub_category = SubCategory.create(name: "Workout Supplies", description: "Gear to get you sweaty", category: category)
Product.create(
    name: "Dumbbell 9000",
    description: "Just when you thought the Dumbbell 8999 didn't go far enough...",
    price: 99.0,
    sale_price: 0.9,
    active: true,
    on_sale: true,
    product_image: "https://images.cdn2.stockunlimited.net/preview1300/dumbbell_1809000.jpg",
    category: category,
    sub_category: sub_category
)