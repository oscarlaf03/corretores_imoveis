if User.find_by(email: 'oscar@teste.com').nil?
  user = User.new(email:'oscar@teste.com')
  user.save
else
  user = User.find_by(email: 'oscar@teste.com')
end
address =["Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200",
         "Rua Peixoto Gomide, 671 - Jardim Paulista São Paulo - SP, 01409-001",
          "Alameda Min. Rocha Azevedo, 471 - Jardins, São Paulo - SP, 01410-001"]
apartments = ['ap1', 'ap2', 'ap3']
photos = ['-1.jpg','-2.jpg','-3.jpg','-4.jpg']
unit_type = ['casa', 'apartamento']
apartments.each_with_index do |ap, index|
  building = Building.new(unit_type: unit_type.sample, user: user, cep: "Faker::Number.number(10)",
                          square_meters:"#{Faker::Number.number(2)}")
  building.title = "#{building.unit_type} #{Faker::Color.color_name}"
  building.description = "#{Faker::TwinPeaks.quote}"
  building.address = address[index]
  building.save
  puts "Building #{index+1} completed"
  photos.each_with_index do |photo, photo_index|
    photo = Photo.new()
    url = "../assets/images/#{ap}#{photo}"
    photo.building = building
    photo.remote_image_url = url
    photo.save
    puts "Photo #{photo_index+1} of Building #{index+1} completed"
  end
  puts "Current buildings:#{Building.count}\n Current photos:#{Photo.count}"
end
puts "======="
puts 'Tasks finished'
puts "Total buildings:#{Building.count}\n Total photos:#{Photo.count}"
puts "======="

