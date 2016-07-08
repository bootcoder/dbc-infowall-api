var PersonCard = React.createClass({

  render: function() {

    var props = this.props.person

    return (
      <div className="small-12 large-3 columns margin-1 fullWidth">
        <div className="height-300px row relative-div rounded-corners rounded-bottom sb-pentagon">
          <PersonCardPhase person={props} />
          <PersonCardImage person={props} />
          <PersonCardName person={props} />
        </div>
      </div>
      );
  }
});
