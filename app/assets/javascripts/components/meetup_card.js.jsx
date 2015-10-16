var MeetupCard = React.createClass({

  render: function() {
    return (
      <div className="small-3 large-3 columns margin-1 fullWidth">
        <div className="sb-dark gray-text height-200px row relative-div">
          <p className="center height-50px bold">{this.props.event.title}</p>
          <div className="center small-12 large-12 columns">
            <p className="desc-text">{this.props.event.description}</p>
          </div>
          <div className="small-12 large-12 bg-teal absolute-bottom height-60px">
            <div className="row">
              <div className="large-9 columns white-text no-margin absolute-bottom">
                <p className="bold date-text">{formatDate(this.props.event.schedule)}</p>
                <p className="bold date-text">{this.props.event.location}</p>
              </div>
              <div className="large-3 columns no-pad">
                <Img className=" fullWidth" src={this.props.event.img_url} className ="height-60px right" />
              </div>
            </div>
          </div>
        </div>
      </div>
      );
  }
});
                // <p className="right organizer-text fullWidth">{this.props.event.organizer}</p>
