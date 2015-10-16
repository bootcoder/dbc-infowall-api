var MeetupImage = React.createClass({

  render: function() {
    return (
      <div className="large-4 columns no-pad">
        <Img className="fullWidth" src={this.props.event.img_url} className ="square-60px right" />
      </div>
    );
  }
});
