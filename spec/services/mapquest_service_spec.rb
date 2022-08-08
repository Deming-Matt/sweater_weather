require 'rails_helper'

RSpec.describe MapquestService do
  let!(:location_search) { MapquestService.location("loveland, co") }

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
end
