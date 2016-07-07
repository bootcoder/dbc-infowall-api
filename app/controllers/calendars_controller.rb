class CalendarsController < ApplicationController

  def index
    @marquee = Marquee.where(display_status: 'active').first

    @old_calendar_events = Event.where(event_type: "calendar")
    @old_calendar_events.destroy_all

    @calendar = Calendar.new(Token.last)
    @calendar.import_events

    @calendar_events = Event.order(schedule: :desc).last(8).reverse
    p "#" * 65
    ap @calendar_events
    p "#" * 65

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @calendar_events }
    end
  end
end


 # [0] #<Event:0x007fdc05dbf130> {
 #                 :id => 793,
 #              :title => "Phase 1 Active Yoga",
 #          :organizer => "Katy",
 #           :location => "Yoga Space",
 #            :img_url => "kt.jpg",
 #          :event_url => nil,
 #          :attending => "0",
 #         :event_type => "calendar",
 #        :description => "Destress and untangle the blues of a hard coding morning with Yoga. Two 40 minute sessions over lunch, choose the one that is best for you.",
 #           :schedule => Thu, 07 Jul 2016 12:30:00 PDT -07:00,
 #         :created_at => Thu, 07 Jul 2016 13:08:11 PDT -07:00,
 #         :updated_at => Thu, 07 Jul 2016 13:08:11 PDT -07:00,
 #        :calendar_id => "4lp3kg21vg2s7igqge4u2egpgg_20160707T193000Z"
 #    },
