class CalendarsController < ApplicationController

  def index

    @old_calendar_events = Event.where(event_type: "calendar")
    @old_calendar_events.destroy_all

    @calendar = Calendar.new(Token.last)
    @calendar.import_events

    @calendar_events = Event.order(schedule: :desc).last(8).reverse

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @calendar_events }
    end

  end
end
