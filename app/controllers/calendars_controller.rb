class CalendarsController < ApplicationController

  def index
    @calendar = Calendar.new(Token.last)
    @calendar.import_events
    @calendar_events = Event.where(event_type: "calendar")
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @calendar_events }
    end
  end
end
