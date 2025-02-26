require 'json'
require 'open-uri'

# Cleaning database
print "Cleaning database..."
if Rails.env == "development"
  Car.destroy_all
end
puts " OK !"

# Generating database
img_car1 = "https://images.unsplash.com/photo-1542362567-b07e54358753?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
img_car2 = "https://images.unsplash.com/photo-1506610654-064fbba4780c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
img_car3 = "https://images.unsplash.com/photo-1594502225401-a9eab8b405dd?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"

print "Creating car 1..."
car1 = Car.new(brand: "Jaguer", car_model: "M4 Hybrid", car_location: "Trocadero - PARIS", rent_price: 200)
car1.photo.attach(io: URI.open(img_car1), filename: 'car1.png', content_type: 'image/png')
car1.save!
puts " OK !"
# ==
print "Creating car 2..."
car2 = Car.new(brand: "Ford", car_model: "Mustang", car_location: "Los Angeles - USA", rent_price: 180)
car2.photo.attach(io: URI.open(img_car2), filename: 'car2.png', content_type: 'image/png')
car2.save!
puts " OK !"
# ==
print "Creating car 3..."
car3 = Car.new(brand: "Renault", car_model: "Capture", car_location: "Angers", rent_price: 50)
car3.photo.attach(io: URI.open(img_car3), filename: 'car3.png', content_type: 'image/png')
car3.save!
puts " OK !"


# End of database generation
puts "End of generation of database"
puts "#{Car.count} cars generated"
