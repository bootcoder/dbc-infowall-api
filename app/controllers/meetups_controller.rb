class MeetupsController < ApplicationController

  include SessionsHelper

  before_action :authenticate_user!, :except => [:cards]


  MEETUP_NOT_FOUND_ERROR = { :errors => "ERROR: Meetup not found." }
  MEETUP_UPDATE_ERROR = { :errors => "ERROR: Meetup update failed." }

  def cards
    @marquee = Marquee.where(display_status: 'active').first
    Meetup.all_meetups
    @meetups = Meetup.order(schedule: :desc).last(8).reverse
    respond_to do |format|
      format.html { render :cards }
      format.json { render json: @meetups }
    end
  end

  def index
    Meetup.all_meetups
    @meetups = Meetup.order(schedule: :desc).reverse
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @meetups }
    end
  end


  def new
    @meetup = Meetup.new
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @meetup }
    end
  end

  def show
    @meetup = Meetup.find_by_id(params[:id])
    if @meetup
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @meetup }
      end
    else
      respond_to do |format|
        format.html { render :show }
        format.json { render json: MEETUP_NOT_FOUND_ERROR }
      end
    end
  end

  def edit
    @meetup = Meetup.find_by_id(params[:id])
    if @meetup
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @meetup }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: MEETUP_NOT_FOUND_ERROR }
      end
    end
  end

  def create
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
      respond_to do |format|
        format.html { redirect_to meetups_path }
        format.json { render json: @meetup }
      end
    else
      respond_to do |format|
        format.html { render :new  }
        format.json { render json: @meetups.errors }
      end
    end
  end

  def update
    @meetup = Meetup.find_by_id(params[:id])
    if @meetup
      if @meetup.update_attributes(meetup_params)
        respond_to do |format|
          format.html { redirect_to meetups_path }
          format.json { render json: @meetups }
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: MEETUP_UPDATE_ERROR }
        end
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: MEETUP_NOT_FOUND_ERROR }
      end
    end
  end

  def destroy
    @meetup = Meetup.find_by_id(params[:id])
    if @meetup
      @meetup.destroy
      @meetups = Meetup.all
      respond_to do |format|
        format.html { redirect_to meetups_path }
        format.json { render json: @meetups }
      end
    else
      respond_to do |format|
        format.html { redirect_to meetups_path }
        format.json { render json: MEETUP_NOT_FOUND_ERROR }
      end
    end

  end

  private

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def meetup_params
    params.require(:meetup).permit(:title, :organizer, :location, :img_url, :meetup_url, :description, :schedule, :attending, :event_type)
  end
end
