var EventCardOrganizer = React.createClass({

  render: function() {
    return (

        <p className="organizer-text">{this.props.event.organizer}</p>

      );
  }
});
