require 'rails_helper'

RSpec.describe OpenWeatherService do
  location = { lat: 40.394386, lng: -105.070584 }
  let!(:weather_service) { OpenWeatherService.forecast(location) }

  it 'establishes connection', :vcr do
    conn = OpenWeatherService.conn

    expect(conn).to be_a(Faraday::Connection)
  end

  it 'sends a respone for weather', :vcr do
    expect(weather_service).to be_a(Hash)
    expect(weather_service).to have_key(:lat)
    expect(weather_service).to have_key(:lon)
    expect(weather_service[:current]).to have_key(:sunrise)
    expect(weather_service[:hourly][0]).to have_key(:temp)

    expect(weather_service).to_not have_key(:minutely)
    expect(weather_service).to_not have_key(:alerts)
  end
end
