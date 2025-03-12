require 'json'
require 'open-uri'
require 'date'

# Cleaning database
print "Cleaning database..."
if Rails.env == "development" || Rails.env == "production" # TODO : TEMPORAIRE
  Review.destroy_all
  Reservation.destroy_all
  Car.destroy_all
  User.destroy_all
end
puts " OK !"

# Generating database
img_car1 = "https://images.unsplash.com/photo-1542362567-b07e54358753?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
img_car2 = "https://images.unsplash.com/photo-1506610654-064fbba4780c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
img_car3 = "https://images.unsplash.com/photo-1594502225401-a9eab8b405dd?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
img_car4 = "https://hips.hearstapps.com/hmg-prod/images/2025-tesla-model-s-1-672d42e172407.jpg?crop=0.465xw:0.466xh;0.285xw,0.361xh&resize=2048:*"
img_car5 = "https://autotijd.be/images/bmw/2020/x5/prijzen/bmw-x5-2020-prijzen-01.jpg"
img_car6 = "https://i.gaw.to/vehicles/photos/40/22/402264-2021-audi-a6.jpg?1024x640"
img_car7 = "https://newsroom.porsche.com/.imaging/mte/porsche-templating-theme/image_1290x726/dam/pnr/2024/Products/992-II/0840_nevada_coupe_u-crane_AKOS0607_edit_V03-sky.jpg/jcr:content/0840_nevada_coupe_u-crane_AKOS0607_edit_V03-sky.jpg"
img_car8 = "https://static.moniteurautomobile.be/imgcontrol/images_tmp/clients/moniteur/c680-d465/content/medias/images/cars/mercedes/c-class/mercedes--classe-c-berline--2021/mercedes--classe-c-berline--2021-m-1.jpg"
img_car9 = "https://cdn-drivek-datak.motork.net/configurator-imgs/cars/fr/Original/PEUGEOT/308/40435_HATCHBACK-5-DOORS/peugeot-308-2021-side-front.jpg"
img_car10 = "https://cdn.motor1.com/images/mgl/kNREB/s1/lamborghini-huracan-sto.webp"
img_car11 = "https://cdn.classic-trader.com/I/images/1920_1920_inset/vehicle_ad_standard_image_60f48638d58c390bad4bc8fb8659945b.jpg"
img_car12 = "https://www.goodtimers.com/fr/medias/2024/10/1960-cadillac-eldorado-biarritz.jpeg"
#
#
#
puts " ====================== "
#
# ===== USERS
print "Creating user 1..."
samy = User.new(email: "samyferedj@outlook.fr", password: "password", first_name: "samy", last_name: "feredj", phone_number: "0123456789", picture_url: "samy-profil.jpg")
samy.save!
puts " OK !"
#
print "Creating user 2..."
arli = User.new(email: "arli@outlook.fr", password: "password", first_name: "arli", last_name: "sefgjini", phone_number: "0145567869")
arli.save!
puts " OK !"
#
print "Creating user 3..."
laurent = User.new(email: "laurent@gmail.com", password: "password", first_name: "laurent", last_name: "millet", phone_number: "0148628923")
laurent.save!
puts " OK !"
#
print "Creating user 4..."
marcus = User.new(email: "marcus@yahoo.fr", password: "password", first_name: "marcus", last_name: "meyer", phone_number: "0187654210")
marcus.save!
puts " OK !"
#
puts " ====================== "
#
# ===== CARS
print "Creating car 1..."
car1 = Car.new(brand: "Jaguar", car_model: "M4 Hybrid", car_location: "Paris - France", rent_price: 200, kilometers: 2_000, release_year: 2025, user_id: samy.id)
car1.photo.attach(io: URI.open(img_car1), filename: 'car1.png', content_type: 'image/png')
car1.save!
puts " OK !"

print "Creating car 2..."
car2 = Car.new(brand: "Ford", car_model: "Mustang", car_location: "Los Angeles - USA", rent_price: 180, kilometers: 25_000, release_year: 2025, user_id: arli.id)
car2.photo.attach(io: URI.open(img_car2), filename: 'car2.png', content_type: 'image/png')
car2.save!
puts " OK !"

print "Creating car 3..."
car3 = Car.new(brand: "Renault", car_model: "Capture", car_location: "Angers - France", rent_price: 50, kilometers: 257_000, release_year: 2024, user_id: samy.id)
car3.photo.attach(io: URI.open(img_car3), filename: 'car3.png', content_type: 'image/png')
car3.save!
puts " OK !"

print "Creating car 4..."
car4 = Car.new(brand: "Tesla", car_model: "Model S", car_location: "San Francisco - USA", rent_price: 250, kilometers: 12_000, release_year: 2023, user_id: arli.id)
car4.photo.attach(io: URI.open(img_car4), filename: 'car4.png', content_type: 'image/png')
car4.save!
puts " OK !"

print "Creating car 5..."
car5 = Car.new(brand: "BMW", car_model: "X5", car_location: "Berlin - Allemagne", rent_price: 170, kilometers: 85_000, release_year: 2022, user_id: arli.id)
car5.photo.attach(io: URI.open(img_car5), filename: 'car5.png', content_type: 'image/png')
car5.save!
puts " OK !"

print "Creating car 6..."
car6 = Car.new(brand: "Audi", car_model: "A6", car_location: "Milan - Italie", rent_price: 160, kilometers: 45_000, release_year: 2021, user_id: arli.id)
car6.photo.attach(io: URI.open(img_car6), filename: 'car6.png', content_type: 'image/png')
car6.save!
puts " OK !"

print "Creating car 7..."
car7 = Car.new(brand: "Porsche", car_model: "911 Carrera", car_location: "Monaco - Monaco", rent_price: 320, kilometers: 8_000, release_year: 2024, user_id: arli.id)
car7.photo.attach(io: URI.open(img_car7), filename: 'car7.png', content_type: 'image/png')
car7.save!
puts " OK !"

print "Creating car 8..."
car8 = Car.new(brand: "Mercedes", car_model: "C-Class", car_location: "Bruxelles - Belgique", rent_price: 140, kilometers: 60_000, release_year: 2020, user_id: arli.id)
car8.photo.attach(io: URI.open(img_car8), filename: 'car8.png', content_type: 'image/png')
car8.save!
puts " OK !"

print "Creating car 9..."
car9 = Car.new(brand: "Peugeot", car_model: "308", car_location: "Lyon - France", rent_price: 70, kilometers: 110_000, release_year: 2019, user_id: arli.id)
car9.photo.attach(io: URI.open(img_car9), filename: 'car9.png', content_type: 'image/png')
car9.save!
puts " OK !"

print "Creating car 10..."
car10 = Car.new(brand: "Lamborghini", car_model: "Huracan", car_location: "Dubai - UAE", rent_price: 500, kilometers: 5_000, release_year: 2024, user_id: arli.id)
car10.photo.attach(io: URI.open(img_car10), filename: 'car10.png', content_type: 'image/png')
car10.save!
puts " OK !"

print "Creating car 11..."
car11 = Car.new(brand: "Pontiac", car_model: "GTO", car_location: "Los Angeles - USA", rent_price: 180, kilometers: 150_000, release_year: 1967, user_id: samy.id)
car11.photo.attach(io: URI.open(img_car11), filename: 'car11.png', content_type: 'image/png')
car11.save!
puts " OK !"

print "Creating car 12..."
car12 = Car.new(brand: "Cadillac", car_model: "Eldorado", car_location: "Bayonne - France", rent_price: 150, kilometers: 120_000, release_year: 1974, user_id: marcus.id)
car12.photo.attach(io: URI.open(img_car12), filename: 'car12.png', content_type: 'image/png')
car12.save!
puts " OK !"

puts " ====================== "


#
# ===== RESERVATIONS
print "Creating reservation 1..."
reservation1 = Reservation.new(car_id: car1.id, user_id: marcus.id, start_date: Date.new(2024, 01, 01), end_date: Date.new(2024, 01, 10))
reservation1.total_price = car1.rent_price*((reservation1.end_date - reservation1.start_date).to_i)
reservation1.status = "Pending"
reservation1.save!
puts " OK !"
# ==
print "Creating reservation 2..."
reservation2 = Reservation.new(car_id: car2.id, user_id: marcus.id, start_date: Date.new(2025, 02, 01), end_date: Date.new(2025, 02, 10))
reservation2.total_price = car2.rent_price*((reservation2.end_date - reservation2.start_date).to_i)
reservation2.status = "Accepted"
reservation2.save!
puts " OK !"
# ==
print "Creating reservation 3..."
reservation3 = Reservation.new(car_id: car3.id, user_id: laurent.id, start_date: Date.new(2025, 03, 01), end_date: Date.new(2025, 03, 30))
reservation3.total_price = car3.rent_price*((reservation3.end_date - reservation3.start_date).to_i)
reservation3.status = "Rejected"
reservation3.save!
puts " OK !"
# ==
print "Creating reservation 4..."
reservation4 = Reservation.new(car_id: car11.id, user_id: marcus.id, start_date: Date.new(2022, 06, 01), end_date: Date.new(2022, 06, 10))
reservation4.total_price = car11.rent_price*((reservation4.end_date - reservation4.start_date).to_i)
reservation4.status = "Accepted"
reservation4.save!
puts " OK !"
# ==
print "Creating reservation 5..."
reservation5 = Reservation.new(car_id: car12.id, user_id: laurent.id, start_date: Date.new(2025, 03, 01), end_date: Date.new(2025, 03, 10))
reservation5.total_price = car11.rent_price*((reservation5.end_date - reservation5.start_date).to_i)
reservation5.status = "Accepted"
reservation5.save!
puts " OK !"
# ==
print "Creating reservation 6..."
reservation6 = Reservation.new(car_id: car2.id, user_id: laurent.id, start_date: Date.new(2024, 06, 05), end_date: Date.new(2024, 06, 10))
reservation6.total_price = car11.rent_price*((reservation6.end_date - reservation6.start_date).to_i)
reservation6.status = "Accepted"
reservation6.save!
puts " OK !"
puts " ====================== "
#
# ===== REVIEWS
print "Creating review 1..."
review1 = Review.new(reservation_id: reservation2.id, rating: 4, content: "Super expérience! Voiture en très bon état et service au top")
review1.save!
puts " OK !"
#
print "Creating review 2..."
review2 = Review.new(reservation_id: reservation6.id, rating: 5, content: "Voiture superbe et sensations au max! Proprio super sympa en passant!")
review2.save!
puts " OK !"
puts " ====================== "
#
print "Creating review 3..."
review3 = Review.new(reservation_id: reservation4.id, rating: 4, content: "Une expérience conforme à mes attentes. Je recommande!")
review3.save!
puts " OK !"
#
# End of database generation
puts "End of generation of database"
puts "#{Car.count} cars generated"
puts "#{User.count} users generated"
puts "#{Reservation.count} reservations generated"
puts "#{Review.count} reviews generated"
