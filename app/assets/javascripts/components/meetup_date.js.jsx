var MeetupDate = React.createClass({

  render: function() {
    return (
      <div className="small-3 no-pad-right large-3 columns black-text">
        <p className="bold pad-left-5P date-text">{formatDate(this.props.event.schedule)}</p>
      </div>
      );
  }
});
