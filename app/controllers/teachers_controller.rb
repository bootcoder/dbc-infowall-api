class TeachersController < ApplicationController

  def topics
    drive = GoogleAdapter.new
    @daily_topics = drive.get_daily_topics
    respond_to do |format|
      format.html { render :daily_topics }
      format.json { render json: @daily_staff }
    end
  end

  def staff
    Teacher.destroy_all
    drive = GoogleAdapter.new
    @daily_staff = []
    count = 0
    drive.get_daily_staff.each do |phase, name|
      count += 1
      next if name == "Final"
      phase = count > 3 ? phase : "Phase #{count}"
      @daily_staff << Teacher.create(name: name, phase: phase)
    end
    ap "* " * 55
    ap @daily_staff
    ap "* " * 55
    respond_to do |format|
      format.html { render :daily_staff }
      format.json { render json: @daily_staff }
    end
  end

end
