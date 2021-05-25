# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Restaurant.destroy_all
User.destroy_all

bob = User.create!(email: "bob@mail.com", password: '123456')
restaurant = Restaurant.new(name: "Chez Bob", address: "16 villa Gaudelet, 75011 Paris", phone_number: "0688658166", email: "chezbob@mail.com" )
restaurant.owner = bob
restaurant.save!
