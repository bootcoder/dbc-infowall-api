var MeetupCard = React.createClass({

  render: function() {
    return (
      <div>
        {this.props.event.id}
        {this.props.event.organizer}
        {this.props.event.location}

      </div>
      );
  }
});
