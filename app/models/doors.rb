class Doors
  def self.close!
    DoorsEvent.create(state: DoorsEvent.states[:closed])
  end

  def self.open!
    DoorsEvent.create(state: DoorsEvent.states[:open])
  end

  def self.toggle!
    return self.close! if self.open?
    self.open!
  end

  def self.open?
    DoorsEvent.last.open?
  end

  def self.last_event
    DoorsEvent.last
  end
end