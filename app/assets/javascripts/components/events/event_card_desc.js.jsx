var EventCardDesc = React.createClass({

  render: function() {
    return (
      <div className="center small-12 large-12 columns">
        <p className="desc-text">{this.props.event.description}</p>
      </div>
      );
  }
});
