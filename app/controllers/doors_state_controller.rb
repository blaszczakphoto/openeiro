class DoorsStateController < ApplicationController
  def toggle
    DoorsState::Toggle.new.call
  end
end
