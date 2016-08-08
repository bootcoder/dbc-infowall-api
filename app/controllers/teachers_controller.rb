class TeachersController < ApplicationController

  def daily_topics
    drive = GoogleAdapter.new
    @daily_topics = drive.get_daily_topics
    respond_to do |format|
      format.html { render :daily_topics }
      format.json { render json: @daily_staff }
    end
  end

  def daily_staff
    drive = GoogleAdapter.new
    @daily_staff = drive.get_daily_staff
    ap "* " * 55
    ap @daily_staff
    ap "* " * 55
    respond_to do |format|
      format.html { render :daily_staff }
      format.json { render json: @daily_staff }
    end
  end

end
