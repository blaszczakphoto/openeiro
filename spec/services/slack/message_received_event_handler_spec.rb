require 'rails_helper'

RSpec.describe Slack::MessageReceivedEventHandler do
  describe '#handle' do
    context 'message says that employee just opened the doors' do
      @messages = %w(o O open openeiro)
      @messages.each do |message|
        it "opens the doors when the message received says: #{message}" do
          expect(Doors).to receive(:open!)

          Slack::MessageReceivedEventHandler.new(message).handle
        end
      end
    end

    context 'other messages' do
      @other_messages = %w(Hej open?)
      @other_messages.each do |message|
        it 'does not open the doors when the message received is not open related' do
          expect(Doors).to_not receive(:open!)

          Slack::MessageReceivedEventHandler.new(message).handle
        end
      end
    end
  end
end