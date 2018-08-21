require 'rails_helper'

RSpec.describe 'Read doors state', :type => :request do
  it 'read state of doors' do
    Doors.close!
    get '/doors_state/read'

    expected_body = {
      status: 'success',
      body: Doors.last_event
    }.to_json

    expect(response.body).to eq(expected_body)
  end
end