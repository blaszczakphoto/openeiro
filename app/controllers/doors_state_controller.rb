class DoorsStateController < ApplicationController
  def toggle
    event = DoorsState::Toggle.new.call
    render json: {
      status: 'success',
      body: event
    }
  end

  def read
    render json: {
      status: 'success',
      body: Doors.last_event
    }
  end
end
