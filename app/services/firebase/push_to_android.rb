module Firebase
  class PushToAndroid
    SERVER_KEY = ENV.fetch('FIREBASE_APP_SERVER_KEY')
    def call
      registration_ids = User.all.map(&:registration_id)
      options = { data: { state: Doors.last_event.attributes }, collapse_key: 'updated_score' }
      fcm = FCM.new(SERVER_KEY)
      fcm.send(registration_ids, options)
    end
  end
end