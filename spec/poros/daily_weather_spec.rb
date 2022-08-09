require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists and has attributes' do
    data =
        {
            "dt": 1659898800,
            "sunrise": 1659873811,
            "sunset": 1659924516,
            "moonrise": 1659911760,
            "moonset": 1659855300,
            "moon_phase": 0.33,
            "temp": {
                "day": 87.96,
                "min": 66.33,
                "max": 89.15,
                "night": 66.33,
                "eve": 68.45,
                "morn": 68
            },
            "feels_like": {
                "day": 85.69,
                "night": 66.56,
                "eve": 68.67,
                "morn": 67.78
            },
            "pressure": 1013,
            "humidity": 30,
            "dew_point": 52.2,
            "wind_speed": 13.2,
            "wind_deg": 144,
            "wind_gust": 20.02,
            "weather": [
                {
                    "id": 501,
                    "main": "Rain",
                    "description": "moderate rain",
                    "icon": "10d"
                }
            ],
            "clouds": 10,
            "pop": 0.84,
            "rain": 4.97,
            "uvi": 9.8
        }
    daily = DailyWeather.new(data)

    expect(daily).to be_a(DailyWeather)
    expect(daily.dt).to eq('Sun, 07 Aug 2022 13:00:00.000000000 -0600')
    expect(daily.sunrise).to eq('Sun, 07 Aug 2022 06:03:31.000000000 -0600')
    expect(daily.sunset).to eq('Sun, 07 Aug 2022 20:08:36.000000000 -0600')
    expect(daily.min).to eq(66.33)
    expect(daily.max).to eq(89.15)
    expect(daily.conditions).to eq("moderate rain")
    expect(daily.icon).to eq("10d")
  end
end
