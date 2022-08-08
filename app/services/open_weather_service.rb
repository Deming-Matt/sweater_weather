class OpenWeatherService

  def self.forecast(location)
    end_point = '/data/2.5/onecall'
    response = conn.get(end_point) do |faraday|
      faraday.params['appid'] = ENV['weather_key']
      faraday.params['exclude'] = 'minutely,alerts'
      faraday.params['lon'] = location[:lng]
      faraday.params['lat'] = location[:lat]
      faraday.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end
