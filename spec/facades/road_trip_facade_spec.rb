require 'rails_helper'

RSpec.describe 'Road trip facade' do
  describe 'get all roadtrip info' do
    it 'gets hourly destination weather upon arrival within 48 hours', :vcr do
      weather = RoadTripFacade.destination_weather("denver, co", "Grand Junction, co")

      expect(weather).to be_a(HourlyWeather)
      expect(weather.conditions).to be_a(String)
    end

    it 'gets destination weather upon arrival within 8 days', :vcr do
      weather = RoadTripFacade.destination_weather("New York, NY", "Panama City, Panama")

      expect(weather).to be_a(DailyWeather)
      expect(weather.conditions).to be_a(String)
    end

    it 'returns no data for longer than 8 days', :vcr do
      weather = RoadTripFacade.destination_weather("Khasan, Russia", "Cape Town, South Africa")

      expect(weather).to be_a(String)
      expect(weather).to eq("No forecast data for this trip")
    end
  end
end
