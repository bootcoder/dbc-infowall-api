require 'rails_helper'

describe CalendarAdapter do

  let(:token) { Token.create(
    access_token: ENV["SEED_ACCESS_TOKEN"],
    refresh_token: ENV["SEED_REFRESH_TOKEN"],
    expires_at: "Thu, 07 Jul 2016 12:23:59 PDT -07:00")
  }

  let(:calendar) { CalendarAdapter.new(token: token) }

  let(:parse_all_events) { calendar.parse_all_events }

  context "initialize" do

    it "creates a new calendar object" do
      expect(calendar.cal).to be_an_instance_of(Google::Calendar)
    end

  end

  context "#all_events" do

    it "it to return an array of calendar events" do
      expect(calendar.all_events).to be_an_instance_of(Array)
    end

  end

  context "#parse_all_events" do

    it "returns an array of EventCard objects" do
      expect(parse_all_events).to be_an_instance_of(Array)
      expect(parse_all_events.first).to be_an_instance_of(EventCard)
    end

    it "returns a maximum of 16 events" do
      expect(parse_all_events.length).to be <= 16
    end

  end

end
