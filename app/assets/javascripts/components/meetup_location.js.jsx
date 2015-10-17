var MeetupLocation = React.createClass({

  render: function() {
    return (

        <p className="location-text">{this.props.event.location}</p>

      );
  }
});
