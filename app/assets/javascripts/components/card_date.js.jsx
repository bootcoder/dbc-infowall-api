var CardDate = React.createClass({

  render: function() {


    return (
      <div className="small-3 no-pad-right large-3 columns black-text">
        <p className="bold pad-left-5P day-text left no-bottom-margin">{giveDay(formatDate(this.props.event.schedule))}</p>
        <p className="bold pad-left-5P day-text left no-bottom-margin">{giveTime(formatDate(this.props.event.schedule))}</p>
        <p className="bold pad-left-5P date-text left no-bottom-margin">{giveDate(formatDate(this.props.event.schedule))}</p>
      </div>
      );
  }
});
