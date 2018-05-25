require "application_system_test_case"


class BuildingsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit buildings_url
  #
  #   assert_selector "h1", text: "Building"
  # end
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Bem-vindo a: teste 1"
  end
end
