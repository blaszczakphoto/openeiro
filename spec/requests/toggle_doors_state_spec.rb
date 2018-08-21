require 'rails_helper'

RSpec.describe 'Toggle doors state', :type => :request do
  it 'changes state of doors' do
    Doors.close!
    post '/doors_state/toggle'

    assert Doors.open?
  end
end