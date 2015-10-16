var MeetupDate = React.createClass({

  render: function() {
    return (
      <div className="small-9 large-9 columns black-text no-margin absolute-bottom">

        <p className="bold pad-left-5P left date-text">{this.props.event.location}{formatDate(this.props.event.schedule)}</p>
        <p className="bold pad-left-5P left organizer-text">{this.props.event.organizer}</p>

      </div>
      );
  }
});
