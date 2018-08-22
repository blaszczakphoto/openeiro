require 'rails_helper'

RSpec.describe 'Toggle doors state', :type => :request do
  before { allow(Slack::PushNotification).to receive(:notify) }
  it 'changes state of doors' do
    Doors.close!
    post '/doors_state/toggle'

    assert Doors.open?
  end

  it 'returns event as object in the request body' do
    Doors.close!
    post '/doors_state/toggle'

    expected_body = {
      status: 'success',
      body: Doors.last_event
    }.to_json

    expect(response.body).to eq(expected_body)
  end
end