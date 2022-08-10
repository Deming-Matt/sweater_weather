require 'rails_helper'

RSpec.describe 'road trip endpoints' do
  it 'can send roadtrip data' do
    user = {
      email:' tcruise@gmail.com',
      password: 'fighter4',
      password_confirmation: 'fighter4'
      }
    post '/api/v1/users', params: user

    login = {
      email:' tcruise@gmail.com',
      password: 'fighter4'
      }
    post '/api/v1/sessions', params: login

    results = JSON.parse(response.body, symbolize_names: true)
    api_key = results[:data][:attributes][:api_key]

    trip = {
    "origin": "Denver, CO",
    "destination": "Castle Rock, CO",
    "api_key": api_key
    }
    post '/api/v1/road_trip', params: trip

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
