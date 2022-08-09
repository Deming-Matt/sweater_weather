require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has attributes' do
  current = {
        "dt": 1659928562,
        "sunrise": 1659873811,
        "sunset": 1659924516,
        "temp": 67.84,
        "feels_like": 68.13,
        "pressure": 1022,
        "humidity": 81,
        "dew_point": 61.79,
        "uvi": 0,
        "clouds": 20,
        "visibility": 10000,
        "wind_speed": 6.91,
        "wind_deg": 230,
        "weather": [
            {
                "id": 801,
                "main": "Clouds",
                "description": "few clouds",
                "icon": "02n"
            }]}
    hourly =
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
    daily =
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

    cw = CurrentWeather.new(current)
    dw = [DailyWeather.new(daily)]
    hw = [HourlyWeather.new(hourly)]
    forecast = Forecast.new({ current_weather: cw,
                            daily_weather: dw,
                            hourly_weather: hw })

    expect(forecast).to be_a Forecast
    expect(forecast.id).to eq("null")
    expect(forecast.type).to eq("forecast")
    expect(forecast.current_weather).to be_a CurrentWeather
    expect(forecast.current_weather.conditions).to eq("few clouds")
    expect(forecast.daily_weather[0]).to be_a DailyWeather
    expect(forecast.hourly_weather[0]).to be_a HourlyWeather
  end
end
