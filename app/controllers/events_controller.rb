class EventsController < ApplicationController

  EVENT_NOT_FOUND_ERROR = { :errors => "ERROR: Event not found." }

  def index
    @events = Event.all_meetups
    ap @events
    @events = Event.all
    render json: @events
  end

  def new
    @event = Event.new
    render json: @event
  end

  def show
    @event = Event.find_by_id(params[:id])
    if @event
      render json: @event
    else
      render json: EVENT_NOT_FOUND_ERROR
    end
  end

  def edit
    @event = Event.find_by_id(params[:id])
    if @event
      render json: @event
    else
      render json: EVENT_NOT_FOUND_ERROR
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event
    else
      render json: @event.errors
    end
  end

  def update
    @event = Event.find_by_id(params[:id])
    if @event
      @event.update_attributes(event_params)
      render json: @event
    else
      render json: EVENT_NOT_FOUND_ERROR
    end
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    if @event
      @event.destroy
      @events = Event.all
      render json: @events
    else
      render json: EVENT_NOT_FOUND_ERROR
    end

  end

  private

  def event_params
    params.require(:event).permit(:name, :organizer, :location, :img_url, :meetup_url, :description, :schedule)
  end
end

