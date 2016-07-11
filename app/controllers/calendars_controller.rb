class CalendarsController < ApplicationController

  def index
    # @marquee = Marquee.where(display_status: 'active').first

    @old_calendar_events = Event.where(event_type: "calendar")
    @old_calendar_events.destroy_all

    @calendar = Calendar.new(Token.last)
    p "#" * 65
    @calendar.import_events

    @calendar_events = Event.order(schedule: :desc).last(8).reverse

    # ap @calendar_events
    p "#" * 65

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @calendar_events }
    end
  end
end
