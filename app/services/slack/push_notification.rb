module Slack
  class PushNotification
    SLACK_INCOMING_WEBHOOK_URL = ENV.fetch('SLACK_INCOMING_WEBHOOK_URL')

    def self.notify
      HTTParty.post(SLACK_INCOMING_WEBHOOK_URL,
        body: {
          text: 'Drzwi do biura otwarte!',
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end