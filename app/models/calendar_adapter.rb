require 'google_calendar'

class CalendarAdapter

  attr_reader :cal

  def initialize(args = {})
    @token = args.fetch(:token, Token.last)
    calendar_login
  end

  def calendar_login
    @cal = Google::Calendar.new(
      :client_id => ENV['CLIENT_ID'],
      :client_secret => ENV['CLIENT_SECRET'],
      :calendar      => ENV['INFOWALL_CALENDAR_ID'],
      :redirect_url  => "https://dbc-infowall.herokuapp.com/auth/google_oath2/@callback"
    )
    @cal.login_with_refresh_token(@token.fresh_token)
    @cal
  end

  def all_events
    @cal.find_future_events
  end

  def sanitize_img_url(staff_name, event)
    return "jenny.jpg" if event.raw["creator"]["email"] == "sally.attaalla@devbootcamp.com"
    return "dbc.jpg" if staff_name == nil || staff_name == "" || staff_name == 'Jenny' || event.title.include?('White-boarding')
    sanitize_name(staff_name, event).split(" ")[0].downcase.concat(".jpg")
  end

  def sanitize_name(name, event)
    return "Jenny" if event.raw["creator"]["email"] == "sally.attaalla@devbootcamp.com"
    return "Katy" if event.title.downcase.include?('yoga')
    name
  end

  def sanitize_location_length(location)
    return "DBC" if location == nil
    return location if location.length < 18
    location.match(/[^-]+$/).to_s
  end

  def sanitize_description_length(description)
    return description if description.length < 200
    "DEPSCRIPTION LENGTH TOO LONG (Must be under 200 characters)"
  end

  def parse_all_events
    cards = []
    all_events.each_with_index do |event, index|
      break if index > 15
      event_datetime = DateTime.parse(event.raw['start']['dateTime'])
      next unless event_datetime > Date.current

      @calendar_event = EventCard.new(
        id: index,
        source_id: event.id,
        title: event.title,
        description: event.description,
        organizer: sanitize_name(event.creator_name, event),
        location: sanitize_location_length(event.location),
        img_url: sanitize_img_url(event.creator_name, event),
        card_type: "calendar",
        schedule: event_datetime
      )

      if @calendar_event.errors.full_messages.length > 1
        ap @calendar_event
        ap @calendar_event.errors
      end

      # ap @calendar_event

      cards << @calendar_event

    end
    cards.uniq {|card| card.title}
  end

  def events_today
    parse_all_events.select { |event| event.schedule.today? }
  end

end
