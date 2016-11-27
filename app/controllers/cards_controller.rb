class CardsController < ApplicationController

  def events
    @calendar_adapter = CalendarAdapter.new
    @events = @calendar_adapter.parse_all_events[0..7]
    render json: @events
  end

  def today
    @calendar_adapter = CalendarAdapter.new
    @events = @calendar_adapter.events_today[0..7]
    render json: @events
  end

  def mentors
    @deputy_adapter = DeputyAdapter.new
    @mentors = @deputy_adapter.mentors_on_shift[0..7]
    render json: @mentors
  end

  def workshops
    @deputy_adapter = DeputyAdapter.new
    @workshops = @deputy_adapter.list_upcoming_workshops[0..7]
    render json: @workshops
  end

  def topics
  end

  def staff
    @sheets_adapter = GoogleSheetsAdapter.new
    @results = @sheets_adapter.get_daily_staff[0..7]
    ap @results
    render json: @results
  end


end
