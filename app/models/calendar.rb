
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
                               :calendar      => ENV['MENTOR_CALENDAR_ID'],
                               :redirect_url  => "https://dbc-infowall.herokuapp.com/auth/google_oath2/@callback" # this is what Google uses for 'applications'
                               )
    p "cal " * 10
    ap @calendar
    p "cal " * 10
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
      e.end_time = Time.now + (60 * 60 * 2) # seconds * min * hours
    end

    @event
  end

  def all_events
    @cal.events
  end

  def get_img_url(staff_name)
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

  def import_events
    calendar_login
    all_events.each do |event|
      # byebugx
      @event = Event.create(
                      title: event.title,
                      description: event.description,
                      organizer: event.creator_name,
                      location: event.location,
                      img_url: get_img_url(event.creator_name),
                      event_type: "calendar",
                      attending: 0,
                      schedule: DateTime.parse(event.raw['start']['dateTime'])
                      )
      ap @event
      ap @event.errors
      @event
    end
  end

end
