class CalendarsController < ApplicationController

  def index
    @calendar = Calendar.new(Token.last)
    p "% " * 200
    ap @calendar
    p "% " * 200
    ap @calendar.cal
    p "% " * 200
    p @calendar.test
    p @calendar.event
    p @calendar.find_event
    p "- " * 200
    p @calendar.all_events
    p "- " * 200
  end
end
