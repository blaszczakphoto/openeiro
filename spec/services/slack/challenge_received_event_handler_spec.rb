require 'rails_helper'

RSpec.describe Slack::ChallengeReceivedEventHandler do
  describe '#handle' do
    it 'returns response required by slack API challenge' do
      result = described_class.new('some_random_challenge_hash').handle
      expect(result).to eq({ challenge: 'some_random_challenge_hash' })
    end
  end
end