class OpenWeatherFacade

  def self.create_forecast_data(latlng)
    json = OpenWeatherService.forecast(latlng)
    forecast = Hash.new
    forecast[:current_weather] = CurrentWeather.new(json[:current])
    forecast[:daily_weather] = json[:daily].map { |day| DailyWeather.new(day) }
    forecast[:hourly_weather] = json[:hourly].map { |hour| HourlyWeather.new(hour) }
    Forecast.new(forecast)
  end

  # def self.current_weather(latlng)
  #   json = OpenWeatherService.forecast(latlng)
  #   result = json[:current]
  #   CurrentWeather.new(result)
  # end
  #
  # def self.hourly_weather(latlng)
  #   json = OpenWeatherService.forecast(latlng)
  #   result = json[:hourly][0..7]
  #   HourlyWeather.new(result)
  # end
  #
  # def self.daily_weather(latlng)
  #   json = OpenWeatherService.forecast(latlng)
  #   result = json[:daily][0..4]
  #   DailyWeather.new(result)
  # end
end
