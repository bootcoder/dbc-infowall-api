class CalendarsController < ApplicationController

  def index
    @calendar = Calendar.new(Token.last)
    @calendar.import_events
    @calendar_events = Event.where(event_type: "calendar")
  end
end
