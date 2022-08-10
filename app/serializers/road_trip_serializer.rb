class RoadTripSerializer
  # include JSONAPI::Serializer
  # set_type 'road_trip'
  # attributes :start_city, :end_city, :travel_time, :weather_at_eta
  def self.trip(trip)
    {
    "data": {
      "id": "null",
      "type": "roadtrip",
      "attributes": {
        "start_city": trip[:start_city],
        "end_city": trip[:end_city],
        "travel_time": trip[:travel_time],
        "weather_at_eta": {
          "temperature": trip[:weather_at_eta][:temperature],
          "conditions": trip[:weather_at_eta][:conditions]
        }
      }
    }
}
  end
end
