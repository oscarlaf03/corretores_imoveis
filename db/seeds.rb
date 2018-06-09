puts 'Finding/creating Company'
if Company.count > 1
  Company.destroy_all
  Company.create(name: 'Imobiliaria teste', address: 'rua dos pinheiros 3')
end

if Company.count == 0
  Company.create(name: 'Imobiliaria teste', address: 'rua dos pinheiros 3')
end

puts 'setting users'


if User.find_by(email: 'oscar@teste.com').nil?
  oscar = User.new(email:'oscar@teste.com', password:'123123', site_owner: true)
  oscar
  .site_owner = true
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

puts 'geocoding addresses'

Building.all.each do |b|
  b.geocode
  b.save
end

