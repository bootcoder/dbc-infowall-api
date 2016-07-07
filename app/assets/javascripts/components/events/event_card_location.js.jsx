var EventCardLocation = React.createClass({

  render: function() {
    return (
      <p className="pad-top-12P bold location-text">{this.props.event.location}</p>
      );
  }
});
