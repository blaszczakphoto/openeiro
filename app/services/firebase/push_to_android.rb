module Firebase
  class PushToAndroid
    SERVER_KEY = ENV.fetch('FIREBASE_APP_SERVER_KEY')
    def call
      registration_ids = ["d3YQvfRi5tk:APA91bF0eGGlFJzbZrdH3P8CDKlMTOYRfhDjGHCAQsXApskYkCXar6VLwAw8zHF2jknB4GQvRcedDOmKJ84h-hy4LIFp4rFcUnGmKruecP2xxsIqCNzCBbWpiflJkmEBQUbkzhCvYpXy"]
      options = {:data=>Doors.last_event.attributes, :collapse_key=>"updated_score"}
      fcm = FCM.new(SERVER_KEY)
      fcm.send(registration_ids, options)
    end
  end
end