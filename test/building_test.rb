require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'
require './lib/building'

class BuildingTest < Minitest::Test

  def test_it_exists
    building = Building.new

    assert_instance_of Building, building
  end

  def test_get_number_of_units
    building = Building.new

    assert_equal [], building.units
  end

  def test_can_add_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal [unit1, unit2], building.units
  end

  def test_get_renters
    building = Building.new

    assert_equal [], building.renters
  end

  def test_add_renters
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    renter1 = Renter.new("Aurora")

    building.add_unit(unit1)
    unit1.add_renter(renter1)

    assert_equal ["Aurora"], building.renters

    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    renter2 = Renter.new("Tim")

    unit2.add_renter(renter2)
    building.add_unit(unit2)

    assert_equal ["Aurora", "Tim"], building.renters
  end

  def test_gets_average_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal 1099.5, building.average_rent
  end

  def test_get_units_with_renter
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})

    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)

    assert_equal [], building.rented_units

    renter1 = Renter.new("Spencer")
    unit2.add_renter(renter1)

    assert_equal unit2, building.rented_units

  end
end
