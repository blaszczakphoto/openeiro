require 'rails_helper'

RSpec.describe Slack::EventHandler do
  describe '.for(params)' do
    context 'request params are challenge' do
      let(:params) do
        {
          'token'=>'Jhj5dZrVaK7ZwHHjRyZWjbDl',
          'challenge'=>'3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P',
          'type'=>'url_verification'
        }
      end
      it 'returns the challenge handler' do
        handler = Slack::EventHandler.for(params)
        expect(handler).to be_instance_of(Slack::ChallengeReceivedEventHandler)
      end

      it 'passes the challenge hash to initialize' do
        expect(Slack::ChallengeReceivedEventHandler)
          .to receive(:new)
          .with('3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P')

        Slack::EventHandler.for(params)
      end
    end

    context 'request params are message event' do
      let(:params) do
        {
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
        }
      end
      it 'returns the message received handler' do
        handler = Slack::EventHandler.for(params)
        expect(handler).to be_instance_of(Slack::MessageReceivedEventHandler)
      end

      it 'passes the received text ("Open" in this case) to initialize' do
        expect(Slack::MessageReceivedEventHandler)
          .to receive(:new)
            .with('Open')

        Slack::EventHandler.for(params)
      end
    end
  end
end