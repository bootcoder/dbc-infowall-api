class GoogleAdapter

  # lead_schedule pulled from 2016 Lead for the day Schedule - DBC-SF
  # https://docs.google.com/spreadsheets/d/1cNslAPoctBreV5dzNspIAbVckaY5RvaET81cl-8bJkM/edit#gid=2102156371

  def initialize
    access_token = Token.last.access_token
    session = GoogleDrive.login_with_oauth(access_token)
    @schedule = session.spreadsheet_by_key("1cNslAPoctBreV5dzNspIAbVckaY5RvaET81cl-8bJkM").worksheets
  end

  def get_daily_topics
    daily_topics = @schedule[3].cells
    ap daily_topics
  end

  def get_daily_leads
    daily_leads = @schedule[0].cells
    ap daily_leads
  end


end
