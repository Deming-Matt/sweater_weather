class Yelp
  attr_reader :id,
              :type,
              :destination_city,
              :forecast,
              :restaurant

  def initialize(data)
    @id = 'null'
    @type = 'munchie'
    @destination_city = "#{data[:restaurant][0][:location][:city]}, #{data[:restaurant][0][:location][:state]}"
    @forecast = { "summary": data[:forecast].conditions,
                  "temperature": data[:forecast].temp}
    @restaurant = { "name": data[:restaurant][0][:name],
                    "address": data[:restaurant][0][:location][:display_address]}
  end
end
