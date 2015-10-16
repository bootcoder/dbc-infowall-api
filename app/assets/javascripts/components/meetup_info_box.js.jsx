var MeetupInfoBox = React.createClass({

  render: function() {
    var props = this.props.event
    return (
      <div className="small-12 large-12 bg-teal absolute-bottom height-50px">
        <div className="row">
          <MeetupDate event={props} />
          <MeetupImage event={props} />
        </div>
      </div>
    );
  }
});
