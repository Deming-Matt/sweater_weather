require 'rails_helper'

RSpec.describe OpenWeatherFacade do
  latlng = { lat: 40.394386, lng: -105.070584 }

  it 'creates forecast data' do
    results = OpenWeatherFacade.create_forecast_data(latlng)

    expect(results).to be_a(Forecast)
    expect(results.current_weather).to be_a(CurrentWeather)
    expect(results.daily_weather).to be_all(DailyWeather)
    expect(results.hourly_weather).to be_all(HourlyWeather)
  end
end
