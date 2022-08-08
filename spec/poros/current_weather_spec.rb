require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists and has attributes' do
    data = {
        "dt": 1659923725,
        "sunrise": 1659873811,
        "sunset": 1659924516,
        "temp": 67.84,
        "feels_like": 68.13,
        "pressure": 1021,
        "humidity": 86,
        "dew_point": 290.75,
        "uvi": 0,
        "clouds": 75,
        "visibility": 10000,
        "wind_speed": 2.57,
        "wind_deg": 270,
        "weather": [
            {
                "id": 803,
                "main": "Clouds",
                "description": "broken clouds",
                "icon": "04d"
            }
        ]
    }
    current = CurrentWeather.new(data)

    expect(current).to be_a(CurrentWeather)
    expect(current.dt).to eq('Sun, 07 Aug 2022 19:55:25.000000000 -0600')
    expect(current.sunrise).to eq('Sun, 07 Aug 2022 06:03:31.000000000 -0600')
    expect(current.sunset).to eq('Sun, 07 Aug 2022 20:08:36.000000000 -0600')
    expect(current.temp).to eq(67.84)
    expect(current.feels_like).to eq(68.13)
    expect(current.humidity).to eq(86)
    expect(current.uvi).to eq(0)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq("broken clouds")
    expect(current.icon).to eq("04d")

    expect(current).to_not eq(:visibility)
  end
end
