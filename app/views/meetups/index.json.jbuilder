json.array!(@meetups) do |meetup|
  json.extract! meetup, :id, :title, :organizer, :location, :img_url, :meetup_url, :attending, :event_type, :description, :schedule
  json.url meetup_url(meetup, format: :json)
end
