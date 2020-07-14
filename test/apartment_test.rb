require 'minitest/autorun'
require 'minitest/pride'

class ApartmentTest < Minitest::Test

  def initialize
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_equal Apartment, unit1
  end

end
