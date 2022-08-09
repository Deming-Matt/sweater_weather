require 'rails_helper'

RSpec.describe 'users endpoints' do
  it 'creates a user' do
    user = {
      email:' tcruise@gmail.com',
      password: 'fighter4',
      password_confirmation: 'fighter4'
      }
    post '/api/v1/users', params: user

    expect(response).to be_successful
    expect(response.status).to be(201)

  end
end
