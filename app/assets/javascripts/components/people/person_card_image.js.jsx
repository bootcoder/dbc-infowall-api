var PersonCardImage = React.createClass({

  render: function() {
    return (
      <div className="small-10 large-10">
        <img src={this.props.person.img_url} className ="circle-60px right fullWidth" />
      </div>
    );
  }
});
