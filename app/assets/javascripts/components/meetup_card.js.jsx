var MeetupCard = React.createClass({

  render: function() {
    return (
      <div>
        <div className="card-layout">
          {this.props.event.id}
          {this.props.event.schedule}
          <div className="content-right">
            {this.props.event.organizer}
            {this.props.event.location}
            {this.props.event.description}
          </div>
          <div className="image-left">
            <img src={this.props.event.img_url} />
          </div>
        </div>
      </div>
      );
  }
});
