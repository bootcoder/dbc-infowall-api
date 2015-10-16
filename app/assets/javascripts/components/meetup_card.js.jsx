var MeetupCard = React.createClass({

  render: function() {
    var props = this.props.event
    return (
      <div className="small-3 large-3 columns margin-1 fullWidth">
        <div className="sb-dark gray-text height-300px row relative-div rounded-corners">
          <MeetupTitle event={props} />
          <MeetupDesc event={props} />
          <MeetupInfoBox event={props} />
        </div>
      </div>
      );
  }
});
