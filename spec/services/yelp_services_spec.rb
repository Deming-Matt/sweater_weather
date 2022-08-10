require 'rails_helper'

RSpec.describe YelpService do
  loc = 'castle rock, co'
  term = 'pizza'
  let!(:service) { YelpService.food_loc_search(loc, term) }

  it 'establishes a connection', :vcr do
    conn = YelpService.conn

    expect(conn).to be_a(Faraday::Connection)
  end

  it 'gets a response', :vcr do
    expect(service).to be_a(Hash)
    expect(service).to have_key(:businesses)
    expect(service[:businesses]).to be_a(Array)
    expect(service[:businesses][0]).to have_key(:name)
    expect(service[:businesses][0][:name]).to eq("Scileppi's at The Old Stone Church")
  end
end
