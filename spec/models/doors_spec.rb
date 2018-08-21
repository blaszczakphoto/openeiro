require 'rails_helper'

RSpec.describe Doors do
  describe '.close!' do
    it 'creates DoorsEvent with closed state' do
      expect { Doors.close! }.to change { DoorsEvent.count }.by(+1)
      expect(DoorsEvent.last.state).to eq('closed')
    end
  end

  describe '.open!' do
    it 'creates DoorsEvent with open state' do
      expect { Doors.open! }.to change { DoorsEvent.count }.by(+1)
      expect(DoorsEvent.last.state).to eq('open')
    end
  end

  describe '.toggle!' do
    it 'creates DoorsEvent with open state when the doors are closed' do
      Doors.close!
      expect { Doors.toggle! }.to change { DoorsEvent.count }.by(+1)
      expect(DoorsEvent.last.state).to eq('open')
    end

    it 'creates DoorsEvent with closed state when the doors are open' do
      Doors.open!
      expect { Doors.toggle! }.to change { DoorsEvent.count }.by(+1)
      expect(DoorsEvent.last.state).to eq('closed')
    end
  end

  describe '.open?' do
    it 'is falsey when doors are closed' do
      Doors.close!
      expect(Doors.open?).to be_falsey
    end

    it 'is true when doors are open' do
      Doors.open!
      expect(Doors.open?).to be_truthy
    end
  end

  describe '.last_event' do
    it 'is the last DoorsEvent' do
      event = DoorsEvent.create
      expect(Doors.last_event).to eq(event)
    end
  end
end