var PersonCardContainer = React.createClass({
  getInitialState: function(){
    return { people: this.props.people }
  },
  render: function() {
    var people = this.props.people;
    console.log(people)
    return (
      <div className='person_card'>
      {people.map(function(person, index){
        return ( <PersonCard key={person.id} person={person} /> )
      })}
      </div>
    )
  }
});
