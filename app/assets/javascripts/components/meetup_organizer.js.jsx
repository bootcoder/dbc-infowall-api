var MeetupOrganizer = React.createClass({

  render: function() {
    return (

        <p className="pad-top-14P bold organizer-text">{this.props.event.organizer}</p>

      );
  }
});
