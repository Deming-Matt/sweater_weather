require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists and has attributes' do
    data =
        {
            "dt": 1659927600,
            "temp": 67.84,
            "feels_like": 68.13,
            "pressure": 1022,
            "humidity": 81,
            "dew_point": 61.79,
            "uvi": 0,
            "clouds": 20,
            "visibility": 10000,
            "wind_speed": 10.11,
            "wind_deg": 214,
            "wind_gust": 16.28,
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "pop": 0.84,
            "rain": {
                "1h": 0.66
            }
          }
    hourly = HourlyWeather.new(data)
    expect(hourly).to be_a(HourlyWeather)
    expect(hourly.dt).to eq('Sun, 07 Aug 2022 21:00:00.000000000 -0600')
    expect(hourly.temp).to eq(67.84)
    expect(hourly.conditions).to eq("light rain")
    expect(hourly.icon).to eq("10n")
  end
end
