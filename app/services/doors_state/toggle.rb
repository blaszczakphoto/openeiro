module DoorsState
  class Toggle
    def call
      Doors.toggle!
    end
  end
end