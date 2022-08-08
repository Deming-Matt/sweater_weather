require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'gets longitude and latitude' do
    location_search = MapquestFacade.latlng('loveland, co')

    expect(location_search).to be_a(Mapquest)
    expect(location_search.lat).to eq(40.394386)
    expect(location_search.lng).to eq(-105.070584)
  end
end
