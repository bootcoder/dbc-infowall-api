var MeetupDate = React.createClass({

  render: function() {
    return (
      <div className="large-9 columns white-text no-margin absolute-bottom">
        <p className="bold pad-left-35px date-text">{formatDate(this.props.event.schedule)}</p>
        <p className="bold pad-left-30px date-text">{this.props.event.location}</p>
      </div>
      );
  }
});
