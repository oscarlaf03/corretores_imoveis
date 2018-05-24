
if User.find_by(email: 'oscar@teste.com').nil?
  oscar = User.new(email:'oscar@teste.com', password:'123123', site_owner: true)
  oscar.site_owner = true
  oscar.save
else
  oscar = User.find_by(email: 'oscar@teste.com')
  oscar.site_owner = true
end

if User.find_by(email: 'andrerdei@gmail.com').nil?
  andre = User.new(email:'andrerdei@gmail.com', password:'123123', site_owner: true)
  andre.site_owner = true
  andre.save
else
  andre = User.find_by(email: 'andrerdei@gmail.com')
  andre.site_owner = true
end

address =["Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200",
         "Rua Peixoto Gomide, 671 - Jardim Paulista São Paulo - SP, 01409-001",
          "Alameda Min. Rocha Azevedo, 471 - Jardins, São Paulo - SP, 01410-001"]
apartments = ['ap1', 'ap2', 'ap3']
seed_photos = ['-1.jpg','-2.jpg','-3.jpg','-4.jpg']
unit_type = ['casa', 'apartamento']
apartments.each_with_index do |ap, index|
  building = Building.new(unit_type: unit_type.sample, user: oscar, cep: "Faker::Number.number(10)",
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


