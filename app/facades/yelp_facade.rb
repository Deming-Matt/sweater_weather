class YelpFacade

  def self.food_loc_search(loc, term)
    yelp = Hash.new
    location = MapquestFacade.latlng(loc)
    forecast = OpenWeatherFacade.create_forecast_data(location)
    json = YelpService.food_loc_search(loc, term)
    yelp[:forecast] = CurrentWeather.new(forecast.current_weather)
    yelp[:restaurant] = json[:businesses].map {|business| business.name }
    yelp[:destination] = json[:businesses].map {|business| business.location.city}
    binding.pry
    Yelp.new(yelp)
  end
end
