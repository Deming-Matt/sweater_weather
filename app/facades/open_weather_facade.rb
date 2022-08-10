class OpenWeatherFacade

  def self.create_forecast_data(latlng)
    json = OpenWeatherService.forecast(latlng)

    Forecast.new({
      current_weather: current_weather(json),
      daily_weather: daily_weather(json),
      hourly_weather: hourly_weather(json)
      })
  end

  def self.create_hourly_data(latlng)
    json = OpenWeatherService.forecast(latlng)
    x = json[:hourly].map { |hour| HourlyWeather.new(hour) }
    binding.pry
  end

  private
    def self.current_weather(json)
      CurrentWeather.new(json[:current])
    end

    def self.daily_weather(json)
      json[:daily].map { |day| DailyWeather.new(day) }
    end

    def self.hourly_weather(json)
      json[:hourly].map { |hour| HourlyWeather.new(hour) }
    end
end
