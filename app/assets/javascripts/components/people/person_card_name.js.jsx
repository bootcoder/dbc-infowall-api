var PersonCardName = React.createClass({

  render: function() {
    return (
      <p className="center teal-text person-text height-50px bold">{this.props.person.name}</p>
      );
  }
});
