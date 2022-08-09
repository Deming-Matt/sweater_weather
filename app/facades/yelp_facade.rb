class YelpFacade

  def self.food_loc_search(loc, term)
    Yelp.new({
      forecast: forecast(loc),
      restaurant: restaurant(loc, term),
      })
  end

  private
    def self.forecast(loc)
      location = MapquestFacade.latlng(loc)
      forecast = OpenWeatherFacade.create_forecast_data(location)
      forecast.current_weather
    end

    def self.restaurant(loc, term)
      json = YelpService.food_loc_search(loc, term)
      json[:businesses]
    end
end
