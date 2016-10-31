# InfoWall API

## JSON API serving various data related to onsite DBC-SF events.

### Resources:
  - Calendar Events from DBC-Infowall calendar
  - Today's Calendar Events from DBC-Infowall calendar (maybe all events for today)
  - Current Staff onsite with area from Teachers scheduling google sheet
  - Current Mentors onsite with area
  - Upcoming Workshops pulled from Deputy workshops
  - Daily teaching topics from Teachers scheduling google sheet


### EndPoints:
  - /events
  - /today
  - /mentors
  - /workshops
  - /topics

### Controller
All endpoints are derived from the ```cards_controller```
