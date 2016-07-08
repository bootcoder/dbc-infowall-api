var PersonCardName = React.createClass({

  render: function() {
    return (
      <p className="center green-text person-text height-50px bold">{this.props.person.name}</p>
      );
  }
});
