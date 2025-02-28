require 'json'
require 'open-uri'
require 'date'

# Cleaning database
print "Cleaning database..."
if Rails.env == "development"
  Reservation.destroy_all
  Car.destroy_all
  User.destroy_all
end
puts " OK !"

# Generating database
img_car1 = "https://images.unsplash.com/photo-1542362567-b07e54358753?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
img_car2 = "https://images.unsplash.com/photo-1506610654-064fbba4780c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
img_car3 = "https://images.unsplash.com/photo-1594502225401-a9eab8b405dd?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
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
arli = User.new(email: "arli@outlook.fr", password: "password", first_name: "arli", last_name: "sefgjini", phone_number: "1234556789")
arli.save!
puts " OK !"
#
print "Creating user 3..."
laurent = User.new(email: "laurent@gmail.com", password: "password", first_name: "laurent", last_name: "millet", phone_number: "3456789123")
laurent.save!
puts " OK !"
#
print "Creating user 4..."
marcus = User.new(email: "marcus@yahoo.fr", password: "password", first_name: "marcus", last_name: "meyer", phone_number: "9876543210")
marcus.save!
puts " OK !"
#
puts " ====================== "
#
# ===== CARS
print "Creating car 1..."
car1 = Car.new(brand: "Jaguer", car_model: "M4 Hybrid", car_location: "Trocadero - PARIS", rent_price: 200, kilometers: 2_000, release_year: 2025, user_id: samy.id)
car1.photo.attach(io: URI.open(img_car1), filename: 'car1.png', content_type: 'image/png')
car1.save!
puts " OK !"
# ==
print "Creating car 2..."
car2 = Car.new(brand: "Ford", car_model: "Mustang", car_location: "Los Angeles - USA", rent_price: 180, kilometers: 25_000, release_year: 2025, user_id: arli.id)
car2.photo.attach(io: URI.open(img_car2), filename: 'car2.png', content_type: 'image/png')
car2.save!
puts " OK !"
# ==
print "Creating car 3..."
car3 = Car.new(brand: "Renault", car_model: "Capture", car_location: "Angers", rent_price: 50, kilometers: 257_000, release_year: 2024, user_id: samy.id)
car3.photo.attach(io: URI.open(img_car3), filename: 'car3.png', content_type: 'image/png')
car3.save!
puts " OK !"
#
puts " ====================== "
#
# ===== RESERVATIONS
print "Creating reservation 1..."
reservation1 = Reservation.new(car_id: car1.id, user_id: samy.id, start_date: Date.new(2025, 01, 01), end_date: Date.new(2025, 01, 31))
reservation1.total_price = car1.rent_price*((reservation1.end_date - reservation1.start_date).to_i)
reservation1.status = "Pending"
reservation1.save!
puts " OK !"
# ==
print "Creating reservation 2..."
reservation2 = Reservation.new(car_id: car2.id, user_id: arli.id, start_date: Date.new(2025, 02, 01), end_date: Date.new(2025, 02, 28))
reservation2.total_price = car2.rent_price*((reservation2.end_date - reservation2.start_date).to_i)
reservation2.status = "Accepted"
reservation2.save!
puts " OK !"
# ==
print "Creating reservation 3..."
reservation3 = Reservation.new(car_id: car3.id, user_id: samy.id, start_date: Date.new(2025, 03, 01), end_date: Date.new(2025, 03, 30))
reservation3.total_price = car3.rent_price*((reservation3.end_date - reservation3.start_date).to_i)
reservation3.status = "Rejected"
reservation3.save!
puts " OK !"
#
puts " ====================== "
#
# End of database generation
puts "End of generation of database"
puts "#{Car.count} cars generated"
puts "#{User.count} users generated"
puts "#{Reservation.count} reservations generated"
