module Slack
  class MessageReceivedEventHandler
    attr_reader :message
    def initialize(message)
      @message = message
    end

    def handle
      Doors.open! if message_implicate_that_doors_were_just_opened?
    end

    private

    def message_implicate_that_doors_were_just_opened?
      allowed_words = %w(o open openeiro)
      allowed_words.any? { |word| word ==  message.downcase }
    end
  end
end