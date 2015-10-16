class EventsController < ApplicationController

  EVENT_NOT_FOUND_ERROR = { :errors => "ERROR: Event not found." }
  EVENT_UPDATE_ERROR = { :errors => "ERROR: Event update failed." }

  def index
    @events = Event.all_meetups
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
    if @event.save
      respond_to do |format|
        format.html { render :index }
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
        respond_to do |format|
          format.html { render :index }
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
        format.html { render :index }
        format.json { render json: @events }
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.json { render json: EVENT_NOT_FOUND_ERROR }
      end
    end

  end

  private

  def event_params
    params.require(:event).permit(:name, :organizer, :location, :img_url, :meetup_url, :description, :schedule)
  end
end

