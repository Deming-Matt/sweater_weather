class Yelp
  attr_reader :id,
              :type,
              :destination_city,
              :forecast,
              :restaurant

  def initialize(data)
    @id = 'null'
    @type = 'munchie'
    @destination_city = create_destionation_city_for_initialization(data)
    @forecast = forecast_for_city(data)
    @restaurant = restaurant_information(data)
  end

  private
    def create_destionation_city_for_initialization(data)
      first_restaurant_location = data[:restaurant][0][:location]
      "#{first_restaurant_location[:city]}, #{first_restaurant_location[:state]}"
    end

    def forecast_for_city(data)
      forecast_data = data[:forecast]
      { "summary": forecast_data.conditions,
        "temperature": forecast_data.temp }
    end

    def restaurant_information(data)
      first_restaurant = data[:restaurant][0]
      { "name": first_restaurant[:name],
        "address": first_restaurant[:location][:display_address] }
    end
end
