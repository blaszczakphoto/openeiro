module DoorsState
  class Toggle
    def call
      event = Doors.toggle!
      Slack::PushNotification.notify if Doors.open?
      event
    end
  end
end