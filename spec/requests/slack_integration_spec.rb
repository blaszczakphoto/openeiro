require 'rails_helper'

RSpec.describe 'Slack integration', :type => :request do
  it 'responds with challenge text when challanged by slack integration webhook' do
    headers = { "CONTENT_TYPE" => "application/json" }
    json_body = {
      token: 'Jhj5dZrVaK7ZwHHjRyZWjbDl',
      challenge: '3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P',
      type: 'url_verification'
    }.to_json

    post '/slack/handle_event', params: json_body, headers: headers

    expected_body = {
      challenge: '3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P',
    }.to_json

    expect(response.body).to eq(expected_body)
  end

  it 'toggles doors state when somebody writes open on slack' do
    Doors.close!
    headers = { "CONTENT_TYPE" => "application/json" }
    json_body = {
      'token' => 'XVnvpFq2e3BSLY5zSzpwZFSt',
      'team_id' => 'TCCFW5PN1',
      'api_app_id' => 'ACCBRNCSE',
      'event' => {
        'type' => 'message',
        'user' => 'UCC4U08LC',
        'text' => 'Open',
        'client_msg_id' => '95738d23-742b-4930-9da0-795db805b909',
        'ts' => '1534922041.000100',
        'channel' => 'CCC4US6TW',
        'event_ts' => '1534922041.000100',
        'channel_type' => 'channel'
      },
      'type' => 'event_callback',
      'event_id' => 'EvCC7D3GL8',
      'event_time' => 1534922041,
      'authed_users' => ['UCC4U08LC'],
      'slack' => {
        'token' => 'XVnvpFq2e3BSLY5zSzpwZFSt',
        'team_id' => 'TCCFW5PN1',
        'api_app_id' => 'ACCBRNCSE',
        'event' => {
          'type' => 'message',
          'user' => 'UCC4U08LC',
          'text' => 'Open',
          'client_msg_id' => '95738d23-742b-4930-9da0-795db805b909',
          'ts' => '1534922041.000100',
          'channel' => 'CCC4US6TW',
          'event_ts' => '1534922041.000100',
          'channel_type' => 'channel'
        }, 'type' => 'event_callback',
        'event_id' => 'EvCC7D3GL8',
        'event_time' => 1534922041,
        'authed_users' => ['UCC4U08LC']
      }
    }.to_json

    post '/slack/handle_event', params: json_body, headers: headers
    expect(Doors.open?).to be_truthy
    expect(Doors).to be_open
  end
end