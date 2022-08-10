require 'rails_helper'

RSpec.describe 'sessions endpoint' do
  it 'can login a user', :vcr do
    user = {
      email:' tcruise@gmail.com',
      password: 'fighter4',
      password_confirmation: 'fighter4'
      }
    post '/api/v1/users', params: user

    user = {
      email:' tcruise@gmail.com',
      password: 'fighter4'
      }
    post '/api/v1/sessions', params: user

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it 'can get 400 response for bad credentials', :vcr do
    user = {
      email:' tcruise@gmail.com',
      password: 'fighter4',
      password_confirmation: 'fighter4'
      }
    post '/api/v1/users', params: user

    user = {
      email:' tcruise@gmail.com',
      password: 'fighter5'
      }
    post '/api/v1/sessions', params: user

    expect(response.status).to eq(401)
  end
end
