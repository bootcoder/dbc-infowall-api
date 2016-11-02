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
    @deputy_adapter = DeputyAdapter.new
    @mentors = @deputy_adapter.mentors_on_shift
    render json: @mentors
  end

  def workshops
    @deputy_adapter = DeputyAdapter.new
    @workshops = @deputy_adapter.list_upcoming_workshops
    render json: @workshops
  end

  def topics
  end

  def staff
    @sheets_adapter = GoogleSheetsAdapter.new
    p @results = @sheets_adapter.get_daily_staff
    render json: @results
  end


end
