# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Container.destroy_all
User.destroy_all
puts "creating user"
user = User.new
user.email = 'bobski@bobski.com'
user.password = "something"
user.save!(validate: false)
puts "user created"

detail1 = "this is my container, there is only one, i am nothing without my container, my container is nothing without me"

puts "creating containers"
Container.create!(name: "A Container",detail: detail1, width: 7.5, height: 8.5, length: 20.2, maximum_weight: 28430, empty_weight: 2050, daily_price:100, user: User.find_by(email: "bobski@bobski.com"), image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Container_01_KMJ.jpg/250px-Container_01_KMJ.jpg")
Container.create!(name: "Another Container",detail: detail1, width: 8.5, height: 7.5, length: 25.27, maximum_weight: 28220, empty_weight: 2020, daily_price:200, user: User.find_by(email: "bobski@bobski.com"), image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Container_01_KMJ.jpg/250px-Container_01_KMJ.jpg")
Container.create!(name: "Terry the Container",detail: detail1, width: 8.5, height: 8.5, length: 31.12, maximum_weight: 17890, empty_weight: 1950, daily_price:300, user: User.find_by(email: "bobski@bobski.com"), image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Container_01_KMJ.jpg/250px-Container_01_KMJ.jpg")
Container.create!(name: "Containerary",detail: detail1, width: 7.56, height: 7.51, length: 40.2, maximum_weight: 26662, empty_weight: 1800, daily_price:400, user: User.find_by(email: "bobski@bobski.com"), image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Container_01_KMJ.jpg/250px-Container_01_KMJ.jpg")
Container.create!(name: "Something subtle",detail: detail1, width: 8.42, height: 8.39, length: 17.2 , maximum_weight: 28531, empty_weight: 1700, daily_price:500, user: User.find_by(email: "bobski@bobski.com"), image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Container_01_KMJ.jpg/250px-Container_01_KMJ.jpg")
Container.create!(name: "Contrary container",detail: detail1, width: 4, height: 4.17, length: 9.2, maximum_weight: 28782, empty_weight: 300, daily_price:600, user: User.find_by(email: "bobski@bobski.com"), image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Container_01_KMJ.jpg/250px-Container_01_KMJ.jpg")
Container.create!(name: "Clark",detail: detail1, width: 7.5, height: 8.5, length: 20.2, maximum_weight: 22110, empty_weight: 2050, daily_price:700, user: User.find_by(email: "bobski@bobski.com"), image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Container_01_KMJ.jpg/250px-Container_01_KMJ.jpg")
puts "Finished seeding"
