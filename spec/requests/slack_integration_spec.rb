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
end