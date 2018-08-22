class SlackController < ApplicationController
  def handle_event
    handler = Slack::EventHandler.for(params)
    result = handler.handle
    render json: result
  end
end
