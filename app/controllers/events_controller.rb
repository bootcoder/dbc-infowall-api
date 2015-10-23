class EventsController < ApplicationController

  include SessionsHelper

  before_action :authenticate_user!, :except => [:cards, :all_cards_today]

  EVENT_NOT_FOUND_ERROR = { :errors => "ERROR: Event not found." }
  EVENT_UPDATE_ERROR = { :errors => "ERROR: Event update failed." }

  def cards
    @marquee = Marquee.where(display_status: 'active').first
    @events = Event.order(schedule: :desc).last(8).reverse
    respond_to do |format|
      format.html { render :cards }
      format.json { render json: @events }
    end
  end

  def all_cards_today
    @events = Event.todays_cards
    respond_to do |format|
      format.html { render :cards }
      format.json { render json: @events }
    end
  end


  def index
    @events = Event.order(schedule: :desc).reverse
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @events }
    end
  end


  def new
    @event = Event.new
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @event }
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    if @event
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @event }
      end
    else
      respond_to do |format|
        format.html { render :show }
        format.json { render json: EVENT_NOT_FOUND_ERROR }
      end
    end
  end

  def edit
    @event = Event.find_by_id(params[:id])
    if @event
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @event }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: EVENT_NOT_FOUND_ERROR }
      end
    end
  end

  def create
    @event = Event.new(event_params)
    Time.zone = "Pacific Time (US & Canada)"
    @event.schedule = Time.zone.parse(event_params['schedule'])
    if @event.save
      respond_to do |format|
        format.html { redirect_to events_path }
        format.json { render json: @event }
      end
    else
      respond_to do |format|
        format.html { render :new  }
        format.json { render json: @events.errors }
      end
    end
  end

  def update
    @event = Event.find_by_id(params[:id])
    if @event
      if @event.update_attributes(event_params)
        Time.zone = "Pacific Time (US & Canada)"
        @event.update_attributes(schedule: Time.zone.parse(event_params['schedule']))
        respond_to do |format|
          format.html { redirect_to events_path }
          format.json { render json: @events }
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: EVENT_UPDATE_ERROR }
        end
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: EVENT_NOT_FOUND_ERROR }
      end
    end
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    if @event
      @event.destroy
      @events = Event.all
      respond_to do |format|
        format.html { redirect_to events_path }
        format.json { render json: @events }
      end
    else
      respond_to do |format|
        format.html { redirect_to events_path }
        format.json { render json: EVENT_NOT_FOUND_ERROR }
      end
    end

  end

  private

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def event_params
    params.require(:event).permit(:title, :organizer, :location, :img_url, :event_url, :description, :schedule, :attending, :event_type)
  end
end

