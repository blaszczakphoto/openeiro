module Slack
  class ChallengeReceivedEventHandler
    attr_reader :challenge_hash
    def initialize(challenge_hash)
      @challenge_hash = challenge_hash
    end

    def handle
      { challenge: challenge_hash }
    end
  end
end