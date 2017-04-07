class GoogleSheetsAdapter

  # 2016 Lead for the day Schedule - DBC-SF
  # Infowall Staff tab
  # https://docs.google.com/spreadsheets/d/1cNslAPoctBreV5dzNspIAbVckaY5RvaET81cl-8bJkM/edit#gid=2102156371

  def initialize
    access_token = Token.last.access_token
    session = GoogleDrive.login_with_oauth(access_token)
    @ws = session.spreadsheet_by_key("1cNslAPoctBreV5dzNspIAbVckaY5RvaET81cl-8bJkM").worksheets
  end

  def leads_worksheet
    @ws.each do |sheet|
      return sheet if sheet.title.include?("Infowall Staff")
    end
  end

  def topics_worksheet
    @ws.each do |sheet|
      return sheet if sheet.title.include?("Topics")
    end
  end


  def get_daily_topics
    results = {}
    @topics_worksheet ||= topics_worksheet
    # ap @topics_worksheet.cells
    results
  end

  def get_daily_staff

    # will need documentation in the schedule about how this pull works.
    # Scratch that, decided to create a standalone sheet. FAQit.

    # first val == row
    # second val == col

    results = {}
    results['Walker'] = 'Campus Director'

    @leads_worksheet ||= leads_worksheet
    day_root_cell = find_day_root_cell
    return results if day_root_cell.nil?
    day_end_cell = find_day_end_cell(day_root_cell)
    count = day_end_cell[0] - day_root_cell[0]

    count.times do |count_int|
      day_type = @leads_worksheet.cells[[day_root_cell[0] + count_int, 1]]
      day_lead = @leads_worksheet.cells[[day_root_cell[0] + count_int, day_root_cell[1]]]
      next if (day_type.nil? || day_lead.nil? || day_lead.match(/Final/) || day_type.match(/Week/))
      results[day_lead.match(/^[^\W]*/).to_s] = day_type
    end
    # p "in set staff " * 10
    # ap results
    results

  end

  def find_day_root_cell

    # Toggle this date on for debugging / DD/MM/YYYY format
    # today = Date.parse("2-1-2016").to_s
    today = Date.today.to_s

    @leads_worksheet.cells.each do |key, value|
      if value.match(/^\d{1,2}\/\d{1,2}$/)
        value += "/#{Date.today.year}" unless value.match(/\d{4}/)
        formatted_value = Date.strptime(value, "%m/%d/%Y").to_s
        return key if Date.parse(formatted_value).to_s == today
      end
    end
    nil
  end

  def find_day_end_cell(day_root_cell)
    root_cell = [day_root_cell[0], 1]
    10.times do
      root_cell[0] += 1
      return root_cell if @leads_worksheet.cells[root_cell] == "End of Week"
    end
  end

end
