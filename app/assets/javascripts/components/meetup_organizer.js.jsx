var MeetupOrganizer = React.createClass({

  render: function() {
    return (

        <p className="pad-top-10P bold organizer-text">{this.props.event.organizer}</p>

      );
  }
});
