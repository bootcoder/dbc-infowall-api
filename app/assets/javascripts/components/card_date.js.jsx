var CardDate = React.createClass({

  render: function() {

    console.log("card top: " + this.props.event.schedule);
    return (
      <div className="small-3 no-pad-right large-3 columns black-text">
        <p className="bold pad-left-5P day-text left no-bottom-margin">{give_day(formatDate(this.props.event.schedule))}</p>
        <p className="bold pad-left-5P day-text left no-bottom-margin">{give_time(formatDate(this.props.event.schedule))}</p>
        <p className="bold pad-left-5P date-text left no-bottom-margin">{give_date(formatDate(this.props.event.schedule))}</p>
      </div>
      );
  }
});
