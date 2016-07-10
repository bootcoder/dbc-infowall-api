class Mentor < ActiveRecord::Base

  def self.parse_deputy_mentors(deputy_array)
    results = []
    deputy_array.each do |mentor|
      results << Mentor.create(
        name: mentor["_DPMetaData"]["EmployeeInfo"]["DisplayName"],
        img_url: mentor["_DPMetaData"]["EmployeeInfo"]["Photo"],
        phase: mentor["_DPMetaData"]["OperationalUnitInfo"]["OperationalUnitName"])
    end
    results
  end
end
