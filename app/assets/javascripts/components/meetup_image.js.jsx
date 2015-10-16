var MeetupImage = React.createClass({

  render: function() {
    return (
      <div className="large-3 columns no-pad">
        <Img className="fullWidth" src={this.props.event.img_url} className ="square-50px right" />
      </div>
    );
  }
});
