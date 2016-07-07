var PersonCardPhase = React.createClass({

  render: function() {
    console.log(this.props)
    return (
      <p className="center teal-text title-text fullWidth pad-top-10px height-50px bold">{this.props.person.phase}</p>
      );
  }
});
