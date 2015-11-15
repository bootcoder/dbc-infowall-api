var CardInfoBox = React.createClass({

  render: function() {
    var props = this.props.event
    if (props.event_type == 'student'){
      return (
        <div className="small-12 large-12 bg-gray absolute-bottom height-60px rounded-bottom">
          <div className="row">
            <CardDate event={props} />
            <div className="small-6 large-6 columns black-text no-margin">
              <CardLocation event={props} />
              <CardOrganizer event={props} />
            </div>
            <CardImage event={props} />
          </div>
        </div>
      );
    } else if (props.event_type == 'meetup') {
      return (
        <div className="small-12 large-12 bg-teal absolute-bottom height-60px rounded-bottom">
          <div className="row">
            <CardDate event={props} />
            <div className="small-6 large-6 columns black-text no-margin">
              <CardLocation event={props} />
              <CardOrganizer event={props} />
            </div>
            <CardImage event={props} />
          </div>
        </div>
      );
    } else if (props.event_type == 'internal') {
      return (
        <div className="small-12 large-12 bg-yellow absolute-bottom height-60px rounded-bottom">
          <div className="row">
            <CardDate event={props} />
            <div className="small-6 large-6 columns black-text no-margin">
              <CardLocation event={props} />
              <CardOrganizer event={props} />
            </div>
            <CardImage event={props} />
          </div>
        </div>
      );
    } else if (props.event_type == 'today') {
      return (
        <div className="small-12 large-12 bg-light-green absolute-bottom height-60px rounded-bottom">
          <div className="row">
            <CardDate event={props} />
            <div className="small-6 large-6 columns black-text no-margin">
              <CardLocation event={props} />
              <CardOrganizer event={props} />
            </div>
            <CardImage event={props} />
          </div>
        </div>
      );
    } else {
      return (
        <div className="small-12 large-12 bg-gray absolute-bottom height-60px rounded-bottom">
          <div className="row">
            <CardDate event={props} />
            <div className="small-6 large-6 columns black-text no-margin">
              <CardLocation event={props} />
              <CardOrganizer event={props} />
            </div>
            <CardImage event={props} />
          </div>
        </div>
      );
    }

  }
});
