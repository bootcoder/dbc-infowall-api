class Event < ActiveRecord::Base

  default_scope { where("schedule between ? and ?", Date.current, 10.days.from_now) }

  # validates_uniqueness_of :event_url
  # validates_presence_of :description

  validates :location, length: { maximum: 18}

  # validates_presence_of :location
  # validates_presence_of :title
  # validates_presence_of :organizer
  # validates_presence_of :img_url
  # validates_presence_of :event_type
  # validates_presence_of :schedule


  def self.todays_cards
    @all = Meetup.all
    @all += Event.all
    @events = []
    @all.each do |event|
      if event.schedule.today?
        event.event_type = 'today'
        @events << event
      end
    end
    @events
  end
end
