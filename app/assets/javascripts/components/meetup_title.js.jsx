var MeetupTitle = React.createClass({

  render: function() {
    return (
      <p className="center teal-text title-text fullWidth pad-top-10px height-50px bold">{this.props.event.title}</p>
      );
  }
});
