var MeetupOrganizer = React.createClass({

  render: function() {
    return (

        <p className="pad-top-12P bold organizer-text">{this.props.event.organizer}</p>

      );
  }
});
