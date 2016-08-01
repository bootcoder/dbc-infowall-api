class MentorsController < ApplicationController
  def index
    deputy = DeputyAdapter.new.get_current_mentors
    @mentors = Mentor.parse_deputy_mentors(deputy["InProgress"])
    # p "* " * 90
    # ap @mentors
    # p "* " * 90
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @mentors }
    end
  end
end
