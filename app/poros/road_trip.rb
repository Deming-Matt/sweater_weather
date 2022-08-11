class RoadTrip
  attr_reader :id,
              :type,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data)
    @id = "null"
    @type = "roadtrip"
    @start_city = data[:origin]
    @end_city = data[:destination]
    @weather_at_eta = data[:weather_at_eta]
  end
end
