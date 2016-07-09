var PersonCardContainer = React.createClass({
  getInitialState: function(){
    return { people: this.props.people }
  },
  render: function() {
    var people = this.props.people;
    return (
      <div>
        {people.map(function(person, index){
          return ( <PersonCard key={person.id} person={person} /> )
        })}
      </div>
    )
  }
});


