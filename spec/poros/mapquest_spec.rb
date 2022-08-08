require 'rails_helper'

RSpec.describe Mapquest do
  it 'exists and has attributes' do
    latlng = { lat: 40.394386, lng: -105.070584 }
    loveland = Mapquest.new(latlng)

    expect(loveland).to be_a(Mapquest)
    expect(loveland.lat).to eq(40.394386)
    expect(loveland.lng).to eq(-105.070584)
  end
end