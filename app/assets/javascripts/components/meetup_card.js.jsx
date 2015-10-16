var MeetupCard = React.createClass({

  render: function() {
    return (
      <div className="small-6 columns margin-1 bg-card">
        <div className="row">
          <div className="small-6 large-6 columns">
            <h4 className="left">{this.props.event.title}</h4>
          </div>
          <div className="small-6 large-6 columns">
            <Img className="right" src={this.props.event.img_url} className ="max-100" />
            <p>{this.props.event.organizer}</p>
          </div>
        </div>
        <div className="panel callout radius">
          <p>{formatDate(this.props.event.schedule)}</p>
        </div>
        <div className="right">
          <p>{this.props.event.location}</p>
          <p>{this.props.event.description}</p>
        </div>
        <p>{this.props.event.id}</p>
      </div>
      );
  }
});
