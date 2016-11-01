class DeputyAdapter

  include HTTParty

  base_uri 'sfmentors.na.deputy.com/api/v1'

  def initialize
    @token = ENV["DEPUTY_TOKEN"]
  end

  def get_endpoint(endpoint)
    self.class.get(endpoint, headers: {"Authorization" => "OAuth #{@token}"})
  end

  def get_current_mentors
    self.class.get("/my/location/1", headers: {"Authorization" => "OAuth #{@token}"})
  end

  def get_current_roster
    # self.class.post("/resource/Roster/QUERY", headers: {"Authorization" => "OAuth #{@token}"}, query: {"search":{"f1":{"field":"OperationalUnit","type":"lk","data":"9"}}})
    self.class.post("/resource/Roster/QUERY", headers: {"Authorization" => "OAuth #{@token}"}, body: {"search":{"f1":{"field":"Id","type":"eq","data":"494}"}}})
  end

  def mentors_on_shift
    mentors_on_shift = get_current_mentors["InProgress"]
    return nil if mentors_on_shift == (nil || mentors_on_shift.empty?)
    results = []
    mentors_on_shift.each_with_index do |mentor, index|
      phase = mentor["_DPMetaData"]["OperationalUnitInfo"]["OperationalUnitName"]
      next if phase == ("Admin" || "Remote Support" || "Interviews" || "Phase 0 Guide")
      results << PersonCard.new(
        id: index,
        name: mentor["_DPMetaData"]["EmployeeInfo"]["DisplayName"],
        img_url: mentor["_DPMetaData"]["EmployeeInfo"]["Photo"],
        phase: phase,
        staff_type: "Mentor")
    end
    results.sort_by { |mentor| mentor.phase }
  end

  def list_upcoming_workshops
    deputy_schedule = get_current_roster
    results = []
    ap deputy_schedule
    deputy_schedule.each do |key, value|
      # next unless shift['StartTimeLocalized'].to_date > Date.today
      # next unless shift['Employee'] != 0
      ap key
      # byebug
      # results << shift
    end
    # p "* " * 90
    # ap results.count
    # p "* " * 90
    # results.sort_by { |shift| shift['StartTimeLocalized']}
  end

end
