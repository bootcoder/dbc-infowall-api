var EventCardContainer = React.createClass({
  getInitialState: function(){
    return { events: this.props.events }
  },
  render: function() {
    var events = this.props.events;
    return (
      <div className=''>
      {events.map(function(event, index){
        return ( <EventCard key={event.id} event={event} /> )
      })}
      </div>
    )
  }
});
