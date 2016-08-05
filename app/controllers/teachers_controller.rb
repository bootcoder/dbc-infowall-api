class TeachersController < ApplicationController

  def daily_topics
    drive = GoogleAdapter.new
    @daily_topics = drive.get_daily_topics
  end

  def daily_leads
    drive = GoogleAdapter.new
    @daily_leads = drive.get_daily_leads
  end

end
