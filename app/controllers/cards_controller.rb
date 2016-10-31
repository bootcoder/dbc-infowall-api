class CardsController < ApplicationController

  def events
    @calendar_adapter = CalendarAdapter.new
    @events = @calendar_adapter.parse_all_events
    render json: @events
  end

  def today
    @calendar_adapter = CalendarAdapter.new
    @events = @calendar_adapter.events_today
    render json: @events
  end

  def mentors

  end

  def workshops

  end

  def topics

  end

  def staff

  end


end
