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

  # it 'gets current weather data' do
  #   current = OpenWeatherFacade.current_weather(latlon)
  #   binding.pry
  #   expect(current).to be_a(CurrentWeather)
  #   expect(current).to have_key(:dt)
  #   expect(current).to have_key(:sunrise)
  #   expect(current).to have_key(:sunset)
  #   expect(current).to have_key(:temp)
  #   expect(current).to have_key(:feels_like)
  #   expect(current).to have_key(:humidity)
  #   expect(current).to have_key(:uvi)
  #   expect(current).to have_key(:visibility)
  #   expect(current[:weather]).to have_key(:conditions)
  #   expect(current[:weather]).to have_key(:icon)
  # end
  #
  # it 'gets hourly weather data' do
  #   hourly = OpenWeatherFacade.hourly_weather(latlon)
  #
  #   expect(hourly).to be_a(HourlyWeather)
  #   expect(hourly[0]).to have_key(:dt)
  #   expect(hourly[0]).to have_key(:temp)
  #   expect(hourly[0][:weather]).to have_key(:description)
  #   expect(hourly[0][:weather]).to have_key(:icon)
  # end
  #
  # it 'gets daily weather data' do
  #   daily = OpenWeatherFacade.daily_weather(latlon)
  #
  #   expect(daily).to be_a(DailyWeather)
  #   expect(daily[0]).to have_key(:dt)
  #   expect(daily[0]).to have_key(:sunrise)
  #   expect(daily[0]).to have_key(:sunset)
  #   expect(daily[0][:temp]).to have_key(:min)
  #   expect(daily[0][:temp]).to have_key(:max)
  #   expect(daily[0][:weather]).to have_key(:description)
  #   expect(daily[0][:weather]).to have_key(:icon)
  # end
end
