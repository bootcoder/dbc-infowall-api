class MentorsController < ApplicationController

  def index
    deputy = DeputyAdapter.new
    endpoint = "/my/location/1"
    p "* " * 45
    ap endpoint
    p "- " * 45
    @deputy = deputy.get_endpoint(endpoint)

    ap @deputy["InProgress"]
    ap @deputy["InProgress"].count
    @deputy["InProgress"].each do |emp|
      ap emp["_DPMetaData"]["EmployeeInfo"]["DisplayName"]
    end
    p "* " * 45
    @mentor_events = Mentor.parse_deputy_mentors(@deputy["InProgress"])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @mentor_events }
    end
  end

end


# desc -
# title
# location
# orginazer
# schedule
# img_url
