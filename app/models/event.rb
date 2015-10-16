class Event < ActiveRecord::Base

  validates_uniqueness_of :meetup_url

  def self.sanitize_description(str)
    new_str = str.slice(0..(str.index('...') + '...'.length))
  end

  def self.pull_meetups
    response = RestClient.get 'https://www.kimonolabs.com/api/d0g1wwgu?apikey=53bf2440ad1b5ac10f5740029c9e4f76'
    @parsed = JSON.parse(response)
    @parsed = @parsed["results"]["collection1"]
  end

  def self.parse_meetups

    @parsed.each do |meetup|
      ap meetup
      Event.create(title: meetup["title"],
           organizer: "Andrew Fitch",
           location: meetup["location"]["text"],
           img_url: ActionController::Base.helpers.asset_path('andrew-fitch.png'),
           meetup_url: meetup["location"]["href"],
           description: sanitize_description(meetup["description"]),
           attending: meetup["attending"],
           event_type: "meetup",
           schedule: DateTime.parse(meetup["date"]))
    end
  end


  def self.all_meetups
    pull_meetups
    parse_meetups
    Event.all
  end

end
