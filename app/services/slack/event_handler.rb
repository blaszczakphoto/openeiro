module Slack
  class EventHandler
    def self.for(params)
      return Slack::ChallengeReceivedEventHandler.new(params['challenge']) if params.has_key?('challenge')
      return Slack::MessageReceivedEventHandler.new(params['event']['text'])
    end
  end
end