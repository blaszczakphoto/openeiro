module DoorsState
  class Toggle
    def call
      event = Doors.toggle!
      Slack::PushNotification.notify if Doors.open?
      Firebase::PushToAndroid.new.call
      event
    end
  end
end