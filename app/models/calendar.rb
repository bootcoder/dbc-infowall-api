
require 'google_calendar'
# require 'pry-byebug'

# Create an instance of the @calendar.
class Calendar

  attr_reader :cal
  def initialize(token)
    @token = token
  end

  def calendar_login
    @cal = Google::Calendar.new(:client_id => ENV['CLIENT_ID'],
                               :client_secret => ENV['CLIENT_SECRET'],
                               :calendar      => ENV['INFOWALL_CALENDAR_ID'],
                               :redirect_url  => "https://dbc-infowall.herokuapp.com/auth/google_oath2/@callback"
                               )
    @cal.login_with_refresh_token(@token.fresh_token)
    @cal
  end

  def event
    # @event = @cal.create_event
    @event = @cal.create_event do |e|
      e.title = 'A Cool Event'
      e.start_time = Time.now
      e.end_time = Time.now + (60 * 60) # seconds * min
    end
    @event.save
  end

  def find_event
    @event = @cal.find_or_create_event_by_id(@event.id) do |e|
      e.title = 'An Updated Cool Event'
      e.start_time = Time.now + (60 * 60 * 2) # seconds * min * hours
    end

    @event
  end

  def all_events
    @cal.find_future_events
  end

  def get_img_url(staff_name, event)
    staff_name = clean_name_yoga(staff_name, event)
    first_name = staff_name.split(" ")[0].capitalize
    p ": " * 75
    ap first_name
    p ": " * 75
    staff_pics = {"Andrew" => 'andrew.jpg',
     "Anne" => 'anne.jpg',
     "Brick" => 'brick4.jpg',
     "Cat" => 'cat.jpg',
     "Hunter" => 'hunter.JPG',
     "Hillary" => 'hillary.jpg',
     "Jen" => 'jen.jpg',
     "Jenny" => 'jenny.jpg',
     "Jordan" => 'jordan.jpg',
     "Julian" => 'julian.jpg',
     "Katy" => 'kt.jpg',
     "Leia" => 'leia.jpg',
     "Marie" => 'marie.jpg',
     "Shambhavi" => 'shambhavi.jpg',
     "Stu" => 'stu.jpg'
   }
   staff_pics.fetch(first_name, "dbc.jpg")
  end

  def clean_name_yoga(name, event)
    return "Katy" if event.title.include?('Yoga')
    name
  end

  def import_events
    calendar_login
    all_events.each do |event|
      event_datetime = DateTime.parse(event.raw['start']['dateTime'])
      # ap event
      # byebug
      if event_datetime > Date.current
        @event = Event.create(
                        calendar_id: event.id,
                        title: event.title,
                        description: event.description,
                        organizer: clean_name_yoga(event.creator_name, event),
                        location: event.location,
                        img_url: get_img_url(event.creator_name, event),
                        event_type: "calendar",
                        attending: 0,
                        schedule: DateTime.parse(event.raw['start']['dateTime'])
                        )
        # ap @event
        # ap @event.errors
        @event
      end
    end
  end

end
