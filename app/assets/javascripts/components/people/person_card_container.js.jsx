var PersonCardContainer = React.createClass({
  getInitialState: function(){
    return { people: this.props.people }
  },
  render: function() {
    var people = this.props.people;
    return (
      <div>
        <div className='row'>
          <div className="ribbon columns large-6 large-offset-3 relative-div"><div className="center ribbon-stitches-top"></div><strong className="ribbon-content"><h1>Mentors Onsite</h1></strong><div className="ribbon-stitches-bottom"></div></div>
        </div>
        {people.map(function(person, index){
          return ( <PersonCard key={person.id} person={person} /> )
        })}
      </div>
    )
  }
});


