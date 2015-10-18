var Card = React.createClass({

  render: function() {
    var props = this.props.event
    return (
      <div className="small-12 large-3 columns margin-1 fullWidth">
        <div className="sb-dark gray-text height-300px row relative-div rounded-corners rounded-bottom">
          <CardTitle event={props} />
          <CardDesc event={props} />
          <CardInfoBox event={props} />
        </div>
      </div>
      );
  }
});
