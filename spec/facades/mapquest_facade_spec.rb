require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'gets longitude and latitude' do
    location_search = MapquestFacade.latlng('loveland, co')

    expect(location_search[:lat]).to eq(40.394386)
    expect(location_search[:lng]).to eq(-105.070584)
  end

  it 'can get directions' do
    directions = MapquestFacade.eta("denver, co", "pueblo, co")

    expect(directions).to eq("01:45:23")
  end
end
