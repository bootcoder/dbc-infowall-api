class CardsController < ApplicationController

  def events
    @calendar_adapter = CalendarAdapter.new
    @results = @calendar_adapter.parse_all_events[0..7]
    render json: @results
  end

  def today
    @calendar_adapter = CalendarAdapter.new
    @results = @calendar_adapter.events_today[0..7]
    render json: @results
  end

  def mentors
    @deputy_adapter = DeputyAdapter.new
    @results = @deputy_adapter.mentors_on_shift[0..7]
    render json: @results
  end

  def workshops
    @deputy_adapter = DeputyAdapter.new
    @results = @deputy_adapter.list_upcoming_workshops[0..7]
    render json: @results
  end

  def topics
    @sheets_adapter = GoogleSheetsAdapter.new
    @results = @sheets_adapter.get_daily_topics[0..7]
    render json: @results
  end

  def staff
    @sheets_adapter = GoogleSheetsAdapter.new
    @results = @sheets_adapter.get_daily_staff[0..7]
    # ap @results
    render json: @results
  end


end
