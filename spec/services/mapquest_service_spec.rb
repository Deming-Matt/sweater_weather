require 'rails_helper'

RSpec.describe MapquestService do
  let!(:location_search) { MapquestService.location("loveland, co") }
  let!(:directions) { MapquestService.directions("denver, co", "pueblo, co") }

  it 'establishes connection' do
    conn = MapquestService.conn

    expect(conn.class).to eq(Faraday::Connection)
  end

  it 'sends response for location' do
    expect(location_search).to be_a(Hash)
    expect(location_search).to have_key(:results)
    expect(location_search[:results]).to be_a(Array)
    expect(location_search[:results][0][:locations][0]).to have_key(:latLng)
  end

  it 'sends a response for directions' do
    expect(directions).to be_a(Hash)
    expect(directions).to have_key(:route)
    expect(directions[:route][:formattedTime]).to eq("01:45:23")
  end
end
