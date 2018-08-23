require 'rails_helper'

RSpec.describe 'Register user', :type => :request do
  it 'creates user record in database' do
    params = { user_id: 'UUID_SAMPLE', registration_id: 'TOKEN_SAMPLE' }

    expect { post '/users/register', params: params }.to change { User.count }.by(+1)
    created_user = User.last

    expect(created_user.uuid).to eq('UUID_SAMPLE')
    expect(created_user.registration_id).to eq('TOKEN_SAMPLE')
  end
end