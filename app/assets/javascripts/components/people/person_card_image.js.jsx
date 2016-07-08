var PersonCardImage = React.createClass({

  render: function() {
    return (
      <div className="small-12 large-12 columns center">
        <img src={this.props.person.img_url} className ="circle-175px" />
      </div>
    );
  }
});
