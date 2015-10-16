var MeetupCard = React.createClass({

  render: function() {
    return (
      <div className="small-3 large-3 columns margin-1 fullWidth">
        <div className="bg-card height-200px row relative-div">

          <p className="center height-50px bold">{this.props.event.title}</p>
          <div className="small-9 large-9 columns">
          </div>

          <div className="small-3 large-3 columns">
          </div>

          <div className="center small-12 large-12 columns">
            <p className="desc-text">{this.props.event.description}</p>
          </div>
          <div className="small-12 large-12 bg-dark absolute-bottom height-50px">
            <div className="row ">
              <div className="large-9 columns">
                <p className="date-text">{formatDate(this.props.event.schedule)}</p>
                <p className="date-text">{this.props.event.location}</p>
              </div>
              <div className="large-3 columns avatar">
                <Img className="right fullWidth" src={this.props.event.img_url} className ="right " />
              </div>
            </div>
          </div>
        </div>
      </div>
      );
  }
});
                // <p className="right organizer-text fullWidth">{this.props.event.organizer}</p>
