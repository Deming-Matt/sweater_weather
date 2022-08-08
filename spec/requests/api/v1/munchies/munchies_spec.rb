require 'rails_helper'

RSpec.describe 'munchies endpoints' do
  it "connects to the index endpoint" do
    get '/api/v1/munchies?location=castlerock,co&term=pizza'
    binding.pry
    response_body = JSON.parse(response.body, symbolize_names: true)
    munchies = response_body[:data]
  end
end
