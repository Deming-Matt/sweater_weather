class MapquestService

  def self.location(search)
    end_point = '/geocoding/v1/address'
    response = conn.get(end_point) do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
      faraday.params['location'] = search
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(from, to)
    end_point = '/directions/v2/route'
    response = conn.get(end_point) do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
      faraday.params['from'] = from
      faraday.params['to'] = to
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
