class SlackController < ApplicationController
  def handle_event
    render json: { challenge: params.permit(:challenge).fetch("challenge") }
  end
end
