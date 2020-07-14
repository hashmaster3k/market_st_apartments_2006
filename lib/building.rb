class Building

  attr_reader :units

  def initialize
    @units =[]
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.map {|unit| unit.renter.name}
  end

  def average_rent
    total_rent = 0.0

    @units.each {|unit| total_rent += unit.monthly_rent}

    (total_rent / @units.length).round(1)
  end
end
