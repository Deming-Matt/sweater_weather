require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has attributes' do
    trip = {
    data: {
        id: "null",
        type: "roadtrip",
        attributes: {
            start_city: "Denver,CO",
            end_city: "Pueblo,CO",
            travel_time: "01:45:23",
            weather_at_eta: {
                temperature: 70.72,
                conditions: "clear sky"
                }
            }
        }
    }

    road_trip = RoadTrip.new(trip)

    expect(raod_trip).to be_a(RoadTrip)
  end
end
