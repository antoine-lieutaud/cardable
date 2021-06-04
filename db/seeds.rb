# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





Voucher.destroy_all
Offer.destroy_all
Restaurant.destroy_all
User.destroy_all

bob = User.create!(email: "bob@mail.com", password: '123456')
restaurant = Restaurant.new(name: "Chez Bob", address: "16 villa Gaudelet, 75011 Paris", phone_number: "0688658166", email: "chezbob@mail.com" )
restaurant.owner = bob
restaurant.save!


brunch1 = Offer.new(
  price: 29, 
  description: "Brunch sucré/salé avec boisson chaude à volonté", 
  name: "Brunch Norvégien", 
  validity: 3,
  state: true
)
brunch1.restaurant_id = restaurant.id
brunch1.save!

brunch2 = Offer.new(
  price: 35, 
  description: "Diner en 5 services comprenant 2 entrées, 2 plats et un déssert", 
  name: "Diner de charme", 
  validity: 3,
  state: true
)
brunch2.restaurant_id = restaurant.id
brunch2.save!

brunch3 = Offer.new(
  price: 25, 
  description: "Diner en 5 services comprenant 2 entrées, 2 plats et un déssert", 
  name: "Menu du buron", 
  validity: 3,
  state: true
)
brunch3.restaurant_id = restaurant.id
brunch3.save!

brunch4 = Offer.new(
  price: 25, 
  description: "Un dessert au choix à la carte", 
  name: "Dessert Gratuit", 
  validity: 2,
  state: false
)
brunch4.restaurant_id = restaurant.id
brunch4.save!

brunch5 = Offer.new(
  price: 21, 
  description: "Un menu léger pour le retour des beaux jours", 
  name: "Menu printanier", 
  validity: 3,
  state: true
)
brunch5.restaurant_id = restaurant.id
brunch5.save!

voucher1 = Voucher.new(limit_use: 3, customer_email: "patrice@gmail.com")
voucher1.offer_id = brunch1.id
voucher1.save!

2.times { voucher1.redeems.create! }

voucher2 = Voucher.new(limit_use: 4, customer_email: "edouard@gmail.com")
voucher2.offer_id = brunch1.id
voucher2.save!

voucher3 = Voucher.new(limit_use: 1, customer_email: "romuald@gmail.com")
voucher3.offer_id = brunch1.id
voucher3.save!

voucher3.redeems.create!

voucher4 = Voucher.new(limit_use: 1, customer_email: "leandre@gmail.com")
voucher4.offer_id = brunch1.id
voucher4.save!


voucher5 = Voucher.new(limit_use: 4, customer_email: "ch.choffel@gmail.com")
voucher5.offer_id = brunch1.id
voucher5.save!

2.times { voucher5.redeems.create! }


voucher6 = Voucher.new(limit_use: 1, customer_email: "antoine.lieutaud@gmail.com")
voucher6.offer_id = brunch1.id
voucher6.save!

voucher7 = Voucher.new(limit_use: 1, customer_email: "antoine.lieutaud@gmail.com", nb_redeems:1)
voucher7.offer_id = brunch1.id
voucher7.save!


voucher_brunche_5_1 = Voucher.new(limit_use: 3, customer_email: "patrice@gmail.com")
voucher_brunche_5_1.offer_id = brunch5.id
voucher_brunche_5_1.save!

2.times { voucher_brunche_5_1.redeems.create! }

voucher_brunche_5_2 = Voucher.new(limit_use: 4, customer_email: "edouard@gmail.com")
voucher_brunche_5_2.offer_id = brunch5.id
voucher_brunche_5_2.save!

voucher_brunche_5_3 = Voucher.new(limit_use: 1, customer_email: "romuald@gmail.com")
voucher_brunche_5_3.offer_id = brunch5.id
voucher_brunche_5_3.save!

voucher_brunche_5_3.redeems.create!

voucher_brunche_5_4 = Voucher.new(limit_use: 1, customer_email: "leandre@gmail.com")
voucher_brunche_5_4.offer_id = brunch5.id
voucher_brunche_5_4.save!


voucher_brunche_5_5 = Voucher.new(limit_use: 4, customer_email: "ch.choffel@gmail.com")
voucher_brunche_5_5.offer_id = brunch5.id
voucher_brunche_5_5.save!

2.times { voucher_brunche_5_5.redeems.create! }


voucher_brunche_5_6 = Voucher.new(limit_use: 1, customer_email: "antoine.lieutaud@gmail.com")
voucher_brunche_5_6.offer_id = brunch5.id
voucher_brunche_5_6.save!

voucher_brunche_5_7 = Voucher.new(limit_use: 1, customer_email: "antoine.lieutaud@gmail.com", nb_redeems:1)
voucher_brunche_5_7.offer_id = brunch5.id
voucher_brunche_5_7.save!

voucher_brunche_3_1 = Voucher.new(limit_use: 3, customer_email: "patrice@gmail.com")
voucher_brunche_3_1.offer_id = brunch3.id
voucher_brunche_3_1.save!

2.times { voucher_brunche_3_1.redeems.create! }

voucher_brunche_3_2 = Voucher.new(limit_use: 4, customer_email: "edouard@gmail.com")
voucher_brunche_3_2.offer_id = brunch3.id
voucher_brunche_3_2.save!

voucher_brunche_3_3 = Voucher.new(limit_use: 1, customer_email: "romuald@gmail.com")
voucher_brunche_3_3.offer_id = brunch3.id
voucher_brunche_3_3.save!

voucher_brunche_3_3.redeems.create!

