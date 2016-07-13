
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
    # @event = @cal.create_event do |e|
    #   e.title = 'A Cool Event'
    #   e.start_time = Time.now
    #   e.end_time = Time.now + (60 * 60) # seconds * min
    # end
    # @event.save
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

  def sanitize_img_url(staff_name, event)
    return "sally.jpg" if event.raw["creator"]["email"] == "sally.attaalla@devbootcamp.com"
    return "dbc.jpg" if staff_name == nil || staff_name == ""
    sanatize_name(staff_name, event).split(" ")[0].downcase.concat(".jpg")
  end

  def sanatize_name(name, event)
    return "Sally" if event.raw["creator"]["email"] == "sally.attaalla@devbootcamp.com"
    return "Katy" if event.title.downcase.include?('yoga')
    name
  end

  def sanatize_location_length(location)
    return "DBC" if location == nil
    return location if location.length < 18
    location.match(/^[^\,-]*/).to_s
  end

  def import_events
    calendar_login
    all_events.each do |event|
      event_datetime = DateTime.parse(event.raw['start']['dateTime'])
      if event_datetime > Date.current
        @event = Event.create(
                        calendar_id: event.id,
                        title: event.title,
                        description: event.description,
                        organizer: sanatize_name(event.creator_name, event),
                        location: sanatize_location_length(event.location),
                        img_url: sanitize_img_url(event.creator_name, event),
                        event_type: "calendar",
                        attending: 0,
                        schedule: DateTime.parse(event.raw['start']['dateTime'])
                        )
        # byebug
        if @event.errors.full_messages.length > 1
          ap @event
          ap @event.errors
        end
        @event
      end
    end
  end

end
