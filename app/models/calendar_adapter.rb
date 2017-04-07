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

    return "lauren.jpg" if event.raw["creator"]["email"] == "lauren.vang@devbootcamp.com"
    return "frank.jpg" if event.raw["creator"]["email"] == "sally.attaalla@devbootcamp.com" ||  event.raw["creator"]["email"] == "jenny@devbootcamp.com" || staff_name == 'Jenny' || event.raw["creator"]["email"] == "frank.gonzalez@devbootcamp.com"
    return "dbc.jpg" if staff_name == nil || staff_name == "" || event.title.include?('White-boarding')

    sanitize_name(staff_name, event).split(" ")[0].downcase.concat(".jpg")

  end

  def sanitize_name(name, event)
    return "Lauren" if event.raw["creator"]["email"] == "lauren.vang@devbootcamp.com"
    return "Frank" if event.raw["creator"]["email"] == "sally.attaalla@devbootcamp.com" || event.raw["creator"]["email"] == "jenny@devbootcamp.com" || event.raw["creator"]["email"] == "frank.gonzalez@devbootcamp.com"
    return "Frank" if name.nil?
    return "Frank" if event.title.include?('White-boarding') || name.downcase.include?('jenny')
    return "Katy" if event.title.downcase.include?('yoga')
    name
  end

  def sanitize_location_length(location)
    return "DBC" if location == nil
    return location if location.length < 18
    location.match(/[^-]+$/).to_s
  end

  def sanitize_description(description)

    return '' unless description

    # Remove any text in parens, (generally staff notes)
    description.gsub!(/\(.*\)/, '')
    description.gsub!("\n", '')

    return description if description.length < 200

    # Split description into words and iterate, add word length to count
    # Return sanitized_description with dots when count reaches 200
    words = description.split(' ')
    sanitized_description = ''
    count = 0

    words.each do |word|
      return sanitized_description.concat('...') if count >= 200
      count += word.length
      sanitized_description.concat(word).concat(' ')
    end

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
        description: sanitize_description(event.description),
        organizer: sanitize_name(event.creator_name, event),
        location: sanitize_location_length(event.location),
        img_url: sanitize_img_url(sanitize_name(event.creator_name, event), event),
        card_type: "calendar",
        schedule: event_datetime
      )

      if @calendar_event.errors.full_messages.length > 0
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
