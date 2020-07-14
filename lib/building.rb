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

  def units_by_number_of_bedrooms
    bedrooms = {1 => nil, 2 => nil, 3 => nil}

    @units.each do |unit|
      #require "pry"; binding.pry
      if unit.bedrooms == 1
        bedrooms[1] = [unit.number]
      elsif unit.bedrooms == 2
        bedrooms[2] = [unit.number]
      elsif unit.bedrooms == 3
        bedrooms[3] = [unit.number]
      end
    end

    bedrooms
  end


end
