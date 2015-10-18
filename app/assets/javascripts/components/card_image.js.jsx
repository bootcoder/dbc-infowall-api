var CardImage = React.createClass({

  render: function() {
    return (
      <div className="small-3 large-3 columns no-pad-left">
        <Img className="fullWidth" src={this.props.event.img_url} className ="circle-60px right" />
      </div>
    );
  }
});
