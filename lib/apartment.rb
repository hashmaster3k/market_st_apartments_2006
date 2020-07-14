class Apartment

    def initialize(apartment)
      @apartment = apartment
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
end
