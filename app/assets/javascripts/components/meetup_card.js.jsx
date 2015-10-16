var MeetupCard = React.createClass({

  render: function() {
    return (
      <div className="small-3 columns pad-1 bg-card">
        <div className="">
          <h4>{this.props.event.title}</h4>
          <p>{this.props.event.id}</p>
          <p>{this.props.event.schedule}</p>
          <div className="right">
            {this.props.event.organizer}
            {this.props.event.location}
            {this.props.event.description}
          </div>
          <div className="left">
            <img src={this.props.event.img_url} />
          </div>
        </div>
      </div>
      );
  }
});
