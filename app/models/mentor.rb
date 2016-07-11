class Mentor < ActiveRecord::Base

  def self.parse_deputy_mentors(deputy_array)
    return nil if deputy_array.empty?
    results = []
    deputy_array.each do |mentor|
      # p ": " * 90
      # p mentor
      results << Mentor.create(
        name: mentor["_DPMetaData"]["EmployeeInfo"]["DisplayName"],
        img_url: mentor["_DPMetaData"]["EmployeeInfo"]["Photo"],
        phase: mentor["_DPMetaData"]["OperationalUnitInfo"]["OperationalUnitName"])
    end
    # p results
    # p ": " * 90
    results.sort_by { |mentor| mentor.phase }
  end
end
