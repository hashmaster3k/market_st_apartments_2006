class Building

  attr_reader :units

  def initialize
    @units =[]
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.map do |unit|
      if unit.renter != nil
        unit.renter.name
      end
    end.compact
  end

  def average_rent
    total_rent = 0.0

    @units.each {|unit| total_rent += unit.monthly_rent}

    (total_rent / @units.length).round(1)
  end

  def rented_units
    rented = []

    if renters == []
      return []

    elsif renters != []

      @units.each do |unit|
        if unit.renter != nil
          rented << unit
        end
      end
    end
    rented
  end

  def renter_with_highest_rent
    highest_rent = rented_units.max_by {|unit| unit.monthly_rent}
    
    highest_rent.renter
  end


end
