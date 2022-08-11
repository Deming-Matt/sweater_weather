class RoadTripFacade

  def self.destination_weather(from, to)
    latlng = MapquestFacade.latlng(to)
    eta = MapquestFacade.eta(from, to)
    forecast = OpenWeatherFacade.create_forecast_data(latlng)
    if eta < 48
      hourly = forecast.hourly_weather[eta]
    elsif eta > 48 && eta < 192
      days = eta/24
      daily = forecast.daily_weather[days]
    else
      "No forecast data for this trip"
    end
  end
end
