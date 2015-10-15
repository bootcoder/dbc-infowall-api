class Event < ActiveRecord::Base

  def self.pull_meetups
    response = RestClient.get 'https://www.kimonolabs.com/api/d0g1wwgu?apikey=53bf2440ad1b5ac10f5740029c9e4f76'
    @parsed = JSON.parse(response)
    @parsed = @parsed["results"]["collection1"]
  end

  def self.parse_meetups
    @parsed.each do |meetup|
      Event.create(name: meetup["title"]["text"],
           organizer: "Andrew Fitch",
           location: meetup["location"]["text"],
           img_url: Faker::Avatar.image,
           meetup_url: meetup["title"]["href"],
           description: meetup["description"]["text"],
           attending: meetup["attending"]["text"],
           event_type: "meetup",
           schedule: DateTime.parse(meetup["date"]))
    end
  end

  def self.sanitize_meetups
    Event.destroy_all(event_type: "meetup")
  end

  def self.all_meetups
    sanitize_meetups
    pull_meetups
    parse_meetups
    Event.all
  end

end
