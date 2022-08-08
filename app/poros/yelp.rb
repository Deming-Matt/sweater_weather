class Yelp
  attr_reader :id,
              :type,
              :destination_city,
              :forecast,
              :restaurant

  def initialize(data)
    @id = 'null'
    @type = 'munchie'
    @destination_city = data[]
  end
end
