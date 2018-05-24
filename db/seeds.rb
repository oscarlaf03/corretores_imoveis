# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)ui

Building.destroy_all

if User.find_by(email: 'oscar@teste.com').nil?
  user = User.new(email:'oscar@teste.com', password:'123123', site_owner: true)
  user.site_owner = true
  user.save
else
  user = User.find_by(email: 'oscar@teste.com')
  user.site_owner = true
end

if User.find_by(email: 'andrerdei@gmail.com').nil?
  user = User.new(email:'andrerdei@gmail.com', password:'123123', site_owner: true)
  user.site_owner = true
  user.save
else
  user = User.find_by(email: 'andrerdei@gmail.com')
  user.site_owner = true
end

address =["Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200",
         "Rua Peixoto Gomide, 671 - Jardim Paulista São Paulo - SP, 01409-001",
          "Alameda Min. Rocha Azevedo, 471 - Jardins, São Paulo - SP, 01410-001"]
apartments = ['ap1', 'ap2', 'ap3']
seed_photos = ['-1.jpg','-2.jpg','-3.jpg','-4.jpg']
unit_type = ['casa', 'apartamento']
apartments.each_with_index do |ap, index|
  building = Building.new(unit_type: unit_type.sample, user: user, cep: "Faker::Number.number(10)",
                          square_meters:"#{Faker::Number.number(2)}")
  building.title = "#{building.unit_type} #{Faker::Color.color_name}"
  building.description = "#{Faker::TwinPeaks.quote}"
  building.address = address[index]
  building.save
  puts "Building #{index+1} completed"
  seed_photos.each_with_index do |seed, photo_index|
    photo = Photo.new
    photo[:image] = "#{ap}#{seed}"
    photo.building = building
    photo.save
    puts "Photo #{photo_index+1} of Building #{index+1} completed"
  end
  puts "Current buildings:#{Building.count}\n Current photos:#{Photo.count}"
end
puts "======="
puts 'Tasks finished'
puts "Total buildings:#{Building.count}\nTotal photos:#{Photo.count}"
puts "======="


