require 'test_helper'

class BuildingTest < ActiveSupport::TestCase

  test ' persist address' do
    user = User.create(username:'test user')
    casa = Building.create( user: user, address: 'rua dos pinheiros 24 São Paulo')
    assert_not_nil casa.address, ['address not nil']
  end

  test ' latitude' do
    user = User.create(username:'test user')
    casa = Building.create( user: user, address: 'rua dos pinheiros 24 São Paulo')
    assert_instance_of(Float, casa.latitude, ['Must be the value'])
  end

   test ' longitude' do
    user = User.create(username:'test user')
    casa = Building.create( user: user, address: 'rua dos pinheiros 24 São Paulo')
    assert_instance_of(Float, casa.longitude, ['Must be the value'])
  end

end
