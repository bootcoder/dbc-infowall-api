require 'rails_helper'

describe CardsController do

  context "ROUTING" do
    it "routes to ROOT" do
      expect(get: '/').to route_to(controller: 'cards', action: 'events')
    end

    it "routes to events" do
      expect(get: '/events').to route_to(controller: 'cards', action: 'events')
    end

    it "routes to today" do
      expect(get: '/today').to route_to(controller: 'cards', action: 'today')
    end

    it "routes to mentors" do
      expect(get: '/mentors').to route_to(controller: 'cards', action: 'mentors')
    end

    it "rotues to workshops" do
      expect(get: '/workshops').to route_to(controller: 'cards', action: 'workshops')
    end

    it "rotues to topics" do
      expect(get: '/topics').to route_to(controller: 'cards', action: 'topics')
    end

    it "routes to staff" do
      expect(get: '/staff').to route_to(controller: 'cards', action: 'staff')
    end
  end

  context "PAYLOAD" do

  end

end
