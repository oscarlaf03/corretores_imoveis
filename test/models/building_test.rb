require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Bem-vindo a: Imobiliaria teste 2"
  end
end
