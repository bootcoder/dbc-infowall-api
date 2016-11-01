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
    params = {"search":{"f1":{"field":"OperationalUnit","type":"eq","data":9},"f2":{"field":"Employee","type":"ne","data":0}}}.to_json
    self.class.post("/resource/Roster/QUERY", headers: {"Authorization" => "OAuth #{@token}"}, body: params)
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
    deputy_schedule.each_with_index do |shift, index|
      next unless shift['StartTimeLocalized'].to_date > Date.today
      results << EventCard.new(
        id: index,
        title: "Workshop",
        description: shift["Comment"],
        organizer: shift["_DPMetaData"]["EmployeeInfo"]["DisplayName"],
        img_url: shift["_DPMetaData"]["EmployeeInfo"]["Photo"],
        card_type: "workshop",
        source_id: shift["Id"],
        location: "DBC",
        schedule: shift["StartTimeLocalized"].to_datetime)
    end
    p "* " * 90
    ap results.count
    p "* " * 90
    results.sort_by { |shift| shift['StartTimeLocalized']}
  end

end
