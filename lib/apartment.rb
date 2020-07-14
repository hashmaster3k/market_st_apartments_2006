class Apartment

    def initialize(apartment)
      @apartment = apartment
      @rented = {}
    end

    def number
      @apartment[:number]
    end

    def monthly_rent
      @apartment[:monthly_rent]
    end

    def bathrooms
      @apartment[:bathrooms]
    end

    def bedrooms
      @apartment[:bedrooms]
    end

    def renter
      @rented.keys[0]
    end

    def add_renter(renter)
      @rented = {renter => @apartment}
    end
end
