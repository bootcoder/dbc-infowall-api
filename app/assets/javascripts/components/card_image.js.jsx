var CardImage = React.createClass({

  render: function() {
    console.log(this.props.event.img_url);
    return (
      <div className="small-3 large-3 columns no-pad-left">
        <Img src={this.props.event.img_url} className ="circle-60px right fullWidth" />
      </div>
    );
  }
});
