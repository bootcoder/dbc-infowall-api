class Meetup < ActiveRecord::Base

  default_scope { where("schedule between ? and ?", Date.current, 10.days.from_now) }

  validates_uniqueness_of :meetup_url
  validates :location, length: { maximum: 18}

  validates_presence_of :meetup_url
  validates_presence_of :location
  validates_presence_of :title
  validates_presence_of :organizer
  validates_presence_of :description
  validates_presence_of :img_url
  validates_presence_of :event_type
  validates_presence_of :schedule


  def self.sanitize_description(str)
    str.slice(0..(str.index('.') + '.'.length))
  end

  def self.sanitize_location(str)
    str.gsub('San Francisco', '')
  end

  def self.pull_meetups
    response = RestClient.get 'https://www.kimonolabs.com/api/d0g1wwgu?apikey=53bf2440ad1b5ac10f5740029c9e4f76'
    @parsed = JSON.parse(response)
    @parsed = @parsed["results"]["collection1"]
  end

  def self.parse_meetups
    @parsed.each do |meetup|
      Time.zone = "Pacific Time (US & Canada)"
      Meetup.create(title: meetup["title"]['text'],
           organizer: "Andrew Fitch",
           location: sanitize_location(meetup["location"]["text"]),
           img_url: "andrew.jpg",
           meetup_url: meetup["location"]["href"],
           description: sanitize_description(meetup["description"]['text']),
           attending: meetup["attending"]['text'],
           event_type: "meetup",
          schedule: Time.zone.parse(meetup["date"][0] + " " + meetup["date"][1])) #=> Fri, 08 Nov 2013 23:59:59 PST -08:00
    end
  end


  def self.all_meetups
    pull_meetups
    parse_meetups
  end

end
