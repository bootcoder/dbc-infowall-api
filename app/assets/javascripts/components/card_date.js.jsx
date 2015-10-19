var CardDate = React.createClass({

  render: function() {
    console.log('prop'+this.props.event.schedule);

    return (
      <div className="small-3 no-pad-right large-3 columns black-text">
        <p className="bold pad-left-5P day-text left no-bottom-margin">{giveDay(formatDateTime(this.props.event.schedule))}</p>
        <p className="bold pad-left-5P day-text left no-bottom-margin">{giveTime(formatDateTime(this.props.event.schedule))}</p>
        <p className="bold pad-left-5P date-text left no-bottom-margin">{giveDate(formatDateTime(this.props.event.schedule))}</p>
      </div>
      );
  }
});
