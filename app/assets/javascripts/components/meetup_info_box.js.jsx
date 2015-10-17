var MeetupInfoBox = React.createClass({

  render: function() {
    var props = this.props.event
    if (props.event_type == 'student'){
      return (
        <div className="small-12 large-12 bg-gray absolute-bottom height-60px rounded-bottom">
          <div className="row">
            <MeetupDate event={props} />
            <div className="small-6 large-6 columns black-text no-margin">
              <MeetupLocation event={props} />
              <MeetupOrganizer event={props} />
            </div>
            <MeetupImage event={props} />
          </div>
        </div>
      );
    } else if (props.event_type == 'meetup') {
      return (
        <div className="small-12 large-12 bg-teal absolute-bottom height-60px rounded-bottom">
          <div className="row">
            <MeetupDate event={props} />
            <div className="small-6 large-6 columns black-text no-margin">
              <MeetupLocation event={props} />
              <MeetupOrganizer event={props} />
            </div>
            <MeetupImage event={props} />
          </div>
        </div>
      );
    }
  }
});
